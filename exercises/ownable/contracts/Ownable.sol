pragma solidity 0.4.23;

contract Ownable {
    address public owner;

    constructor() public {
        // set owner using deployer address (use msg.sender)
        owner = msg.sender;                                                   // @remove-line
    }

    // implement onlyOwner modifier that requires sender to be an owner
    modifier onlyOwner() {                                                    // @remove-line
        require(msg.sender == owner);                                         // @remove-line
        _;                                                                    // @remove-line
    }                                                                         // @remove-line

    // implement transferOwnership that accepts and sets address of the new owner
    // only owner should be able to use transferOwnership (use onlyOwner modifier)
    function transferOwnership(address _newOwner) onlyOwner public {          // @remove-line
        owner = _newOwner;                                                    // @remove-line
    }                                                                         // @remove-line
}
