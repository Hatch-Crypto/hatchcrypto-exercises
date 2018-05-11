pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "../contracts/Counter.sol";

contract CounterTest {
    Counter counter = new Counter();

    function testPublicCount() public {
        Assert.equal(counter.count(), 0, "Doesn't have public count set to 0");
    }

    function testTicks() public {
        counter.tick();
        counter.tick();
        Assert.equal(counter.count(), 2, "Tick doesn't increment count by 1");
    }

    function testReset() public {
        counter.tick();
        counter.reset();
        Assert.equal(counter.count(), 0, "Resetting count doesn't work");
    }
}
