pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "../contracts/UseForType.sol";
import "../contracts/UseLikeModule.sol";


contract MathOperationsLibTest {
    function testUsingModule() public {
        UseLikeModule instance = new UseLikeModule();
        uint result = instance.add(23, 17);
        Assert.equal(result, 40, "addition using module doesn't work");
    }

    function testUsingForType() public {
        UseForType instance = new UseForType();
        uint result = instance.add(23, 17);
        Assert.equal(result, 40, "addition using for a type doesn't work");
    }
}
