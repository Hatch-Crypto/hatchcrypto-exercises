pragma solidity 0.4.23;

import "../iterable-mapping/Airdrop.sol";


contract Events is Airdrop {
    // define AddressAdded(addr) event
    event AddressAdded(address addr);                         // @remove-line

    // define AddressRemoved(addr) event
    event AddressRemoved(address addr);                       // @remove-line

    // define Airdrop(value, recipientsNum) event
    event Airdrop(uint value, uint recipientsNum);            // @remove-line

    function addAddress(address _address) public {
        // use super to call addAddress(address) from Airdrop
        super.addAddress(_address);                           // @remove-line
        emit AddressAdded(_address);                          // @remove-line
    }

    function removeAddress(address _address) public {
        super.removeAddress(_address);                        // @remove-line
        emit AddressRemoved(_address);                        // @remove-line
    }

    function airdrop(uint _value) public {
        super.airdrop(_value);                                // @remove-line
        emit Airdrop(_value, addresses.length);               // @remove-line
    }
}
