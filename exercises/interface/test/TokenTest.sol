pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "../contracts/Token.sol";


contract TokenTest {
    address ADDR = 0x627306090abaB3A6e1400e9345bC60c78a8BEf57;
    Token token;

    constructor() public {
        token = new Token(address(this), 10000);
    }

    function testTotalSupply() public {
        Assert.equal(token.totalSupply(), 10000, "total supply is incorrect");
    }

    function testBalanceOf() public {
        Assert.equal(token.balanceOf(address(this)), 10000, "balance is incorrect");
    }

    function testPreventFromSendingToZeroAddress() public {
        bool result = address(token).call(bytes4(keccak256("transfer(address,uint256)")), 0, 100);
        Assert.equal(result, false, "allows to transfer to 0 address");
    }

    function testPreventFromSendingMoreThanYouHave() public {
        bool result = address(token).call(bytes4(keccak256("transfer(address,uint256)")), ADDR, 10001);
        Assert.equal(result, false, "allows to transfer more than sender has");
    }

    function testTransferFunds() public {
        bool result = token.transfer(ADDR, 1000);
        Assert.equal(result, true, "transfer doesn't return true");
        Assert.equal(token.balanceOf(address(this)), 9000, "sender balance is incorrect");
        Assert.equal(token.balanceOf(ADDR), 1000, "recipient balance is incorrect");
    }
}
