pragma solidity 0.4.23;

import "../ownable/Ownable.sol";


contract Deposit is Ownable {
    // allow contract to accept funds upon creation
    constructor() public payable {}                   // @remove-line

    // allow contract to accept funds via regular transfer
    function () public payable {}                     // @remove-line

    // allow owner to withdraw the entire balance
    function withdraw() public onlyOwner {            // @remove-line
        owner.transfer(address(this).balance);        // @remove-line
    }                                                 // @remove-line
}
