pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "../contracts/Crowdsale.sol";


contract CrowdsaleTest is Crowdsale {
    function testRate() public {
        stage = Stage.Closed;
        Assert.equal(rate(), 5, "rate should be 5 when crowdsale is closed");
        stage = Stage.Open;
        Assert.equal(rate(), 5, "rate should be 5 when crowdsale is open");
        stage = Stage.Presale;
        Assert.equal(rate(), 50, "rate should be 50 when crowdsale is in presale");
    }

    function testPreventFromBuying() public {
        stage = Stage.Closed;
        bool result = address(this).call(bytes4(keccak256("buyTokens()")));
        Assert.equal(result, false, "it's possible to buy tokens when crowdsale is closed");
        stage = Stage.Open;
        result = address(this).call(bytes4(keccak256("buyTokens()")));
        Assert.equal(result, true, "it's not possible to buy tokens when crowdsale is open");
        stage = Stage.Presale;
        result = address(this).call(bytes4(keccak256("buyTokens()")));
        Assert.equal(result, true, "it's not possible to buy tokens when crowdsale is in presale");
    }
}
