pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "./HelloWorld.sol";

contract HelloWorldTest {
    function testReturningHelloWorld() public {
        HelloWorld helloWorld = new HelloWorld();
        Assert.equal(keccak256(helloWorld.greet()), keccak256("Hello, World!"),
            "Returned value isn't a \"Hello, World!\" string");
    }
}
