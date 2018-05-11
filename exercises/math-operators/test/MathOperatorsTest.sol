pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "../contracts/MathOperators.sol";

contract MathOperatorsTest {
    MathOperators mathOperators = new MathOperators();

    function testAddition() public {
        Assert.equal(mathOperators.add(100, 20), 120, "Addition gives incorrect result");
    }

    function testSubtraction() public {
        Assert.equal(mathOperators.sub(100, 20), 80, "Subtraction gives incorrect result");
    }

    function testMultiplication() public {
        Assert.equal(mathOperators.mul(100, 20), 2000, "Multiplication gives incorrect result");
    }

    function testModulus() public {
        Assert.equal(mathOperators.mod(100, 3), 1, "Modulus gives incorrect result");
    }

    function testDivision() public {
        Assert.equal(mathOperators.div(100, 20), 5, "Division gives incorrect result");
    }
}
