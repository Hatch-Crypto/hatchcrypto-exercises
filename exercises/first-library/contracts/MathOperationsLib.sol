pragma solidity 0.4.23;

// notice that MathOperators is a library, not a contract
library MathOperationsLib {
    function add(uint256 self, uint256 _b) public pure returns (uint256) {
        return self + _b;
    }
}
