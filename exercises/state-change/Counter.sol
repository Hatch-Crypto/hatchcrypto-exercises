pragma solidity 0.4.23;

contract Counter {
    // define public count variable (uint) to store number of ticks
    uint public count = 0; // @remove-line

    // implement tick() to increment counter
    function tick() public {       // @remove-line
        count++;                   // @remove-line
    }                              // @remove-line

    // implement reset() to reset counter back to 0
    function reset() public {      // @remove-line
        count = 0;                 // @remove-line
    }                              // @remove-line
}
