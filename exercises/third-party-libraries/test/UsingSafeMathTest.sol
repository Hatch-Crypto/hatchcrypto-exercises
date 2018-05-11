pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "../contracts/UsingSafeMath.sol";


contract UsingSafeMathTest {
    function testGivesCorrectReults() public {
        UsingSafeMath instance = new UsingSafeMath();
        uint value = instance.sub(5, 2);
        Assert.equal(value, 3, "doesn't return correct result");
    }

    function testThrowsOnUnderflow() public {
        UsingSafeMath instance = new UsingSafeMath();
        bool result = address(instance).call(bytes4(keccak256("sub(uint256,uint256)")), 1, 2);
        Assert.equal(result, false, "doesn't throw on underflow");
    }
}
