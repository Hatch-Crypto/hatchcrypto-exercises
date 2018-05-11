pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "../contracts/Deposit.sol";


contract DepositTest {
    uint public initialBalance = 1 ether;
    address constant ADDR = 0x627306090abaB3A6e1400e9345bC60c78a8BEf57;

    function () public payable {}

    function testInitializeWithValue() public {
        Deposit instance = (new Deposit).value(100 finney)();
        Assert.equal(address(instance).balance, 100 finney, "constructor doesn't accept funds");
    }

    function testFallbackFunction() public {
        Deposit instance = new Deposit();
        bool result = address(instance).send(100 finney);
        Assert.equal(result, true, "contract doesn't accept transfers");
    }

    function testWithdraw() public {
        Deposit instance = new Deposit();
        uint initBalance = address(this).balance;
        address(instance).transfer(200 finney);
        instance.withdraw();
        Assert.equal(address(this).balance, initBalance, "funds after withdrawal are missing");
    }

    function testPreventNonOwnerFromWithdraw() public {
        Deposit instance = new Deposit();
        instance.transferOwnership(ADDR);
        address(instance).transfer(200 finney);
        bool result = address(instance).call(bytes4(keccak256("withdraw()")));
        Assert.equal(result, false, "non owner can call withdraw");
    }
}
