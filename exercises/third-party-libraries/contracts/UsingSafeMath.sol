pragma solidity 0.4.23;

import "openzeppelin-solidity/contracts/math/SafeMath.sol";


contract UsingSafeMath {
    using SafeMath for uint256;

    function sub(uint _a, uint _b) public pure returns (uint) {
        // use sub function provided by SafeMath to throw on underflow
        return _a.sub(_b);                   // @remove-line
    }
}
