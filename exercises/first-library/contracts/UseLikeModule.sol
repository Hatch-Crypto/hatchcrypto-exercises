pragma solidity 0.4.23;

import "./MathOperationsLib.sol";


contract UseLikeModule {
    function add(uint _a, uint _b) public pure returns (uint) {
        // implement addition calling MathOperators.add directly
        return MathOperationsLib.add(_a, _b);         // @remove-line
    }
}
