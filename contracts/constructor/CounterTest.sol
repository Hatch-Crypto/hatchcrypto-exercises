pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "./Counter.sol";

contract CounterTest {
    function testCountInitialization() public {
        Counter counter = new Counter(10);
        Assert.equal(counter.count(), 10, "count is not initialized with 1st constructor argument");
    }
}
