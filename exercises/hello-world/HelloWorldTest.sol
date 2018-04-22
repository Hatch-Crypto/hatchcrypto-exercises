pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "./HelloWorld.sol";

contract HelloWorldTest {
    HelloWorld helloWorld = new HelloWorld();

    function testReturningHelloWorld() public {
        Assert.equal(keccak256(helloWorld.greet()), keccak256("Hello, World!"),
            "Returned value isn't a \"Hello, World!\" string");
    }
}
