pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "../contracts/FunctionSignature.sol";


contract FunctionSignatureTest {
    function testSucceededCall() public {
        FunctionSignature functionSignature = new FunctionSignature();
        bool result = functionSignature.isMoreThanFive(6);
        Assert.equal(result, true, "doesn't return true when call should succeed");
    }

    function testFailureCall() public {
        FunctionSignature functionSignature = new FunctionSignature();
        bool result = functionSignature.isMoreThanFive(5);
        Assert.equal(result, false, "doesn't return false when call should fail");
    }
}
