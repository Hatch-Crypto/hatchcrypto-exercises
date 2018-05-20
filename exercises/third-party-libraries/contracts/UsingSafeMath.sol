pragma solidity 0.4.23;

import "openzeppelin-solidity/contracts/math/SafeMath.sol";


contract UsingSafeMath {
    // make SafeMath functions available on uint256
    using SafeMath for uint256;              // @remove-line

    function sub(uint _a, uint _b) public pure returns (uint) {
        // use sub function provided by SafeMath to throw on underflow
        return _a.sub(_b);                   // @remove-line
    }
}
