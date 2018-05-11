pragma solidity 0.4.23;

import "./MathOperationsLib.sol";


contract UseForType {
    using MathOperationsLib for uint;

    function add(uint _a, uint _b) public pure returns (uint) {
        // implement addition calling add directly on uint variable
        return _a.add(_b);                          // @remove-line
    }
}
