pragma solidity 0.4.23;

import "./MathOperationsLib.sol";


contract UseForType {
    // make MathOperationsLib functions available on uint
    using MathOperationsLib for uint;               // @remove-line

    function add(uint _a, uint _b) public pure returns (uint) {
        // implement addition calling add directly on uint variable
        return _a.add(_b);                          // @remove-line
    }
}
