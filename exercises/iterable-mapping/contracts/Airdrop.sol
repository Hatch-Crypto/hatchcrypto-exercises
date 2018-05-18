pragma solidity 0.4.23;

contract Airdrop {
    address[] public addresses;
    mapping(address => bool) public isSet;
    mapping(address => uint) public balances;

    // implement addAddress(address) that adds address to the addresses array
    // make a precondition that address is not a duplicate
    function addAddress(address _address) public {       // @remove-line
        require(!isSet[_address]);                       // @remove-line
        addresses.push(_address);                        // @remove-line
        isSet[_address] = true;                          // @remove-line
    }                                                    // @remove-line

    // implement removeAddress(address) that removes address from the addresses array
    // make a precondition that address is already set
    function removeAddress(address _address) public {    // @remove-line
        require(isSet[_address]);                        // @remove-line
        delete balances[_address];                       // @remove-line
        delete isSet[_address];                          // @remove-line
        for (uint i = 0; i < addresses.length; i++) {    // @remove-line
            if (addresses[i] == _address) {              // @remove-line
                delete addresses[i];                     // @remove-line
            }                                            // @remove-line
        }                                                // @remove-line
    }                                                    // @remove-line

    // implement airdrop(uint value) that increase balance of each address by specified value
    function airdrop(uint _value) public {               // @remove-line
        for (uint i = 0; i < addresses.length; i++) {    // @remove-line
            balances[addresses[i]] += _value;            // @remove-line
        }                                                // @remove-line
    }                                                    // @remove-line
}
