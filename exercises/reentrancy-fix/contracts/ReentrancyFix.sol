pragma solidity 0.4.23;

import "./Balances.sol";


contract SecureBalancesWithCallValue is Balances {
    function withdraw() public {
        // change code so it is not vulnerable using call.value
        uint amount = balances[msg.sender];                     // @remove-line
        balances[msg.sender] = 0;                               // @remove-line
        if (!msg.sender.call.value(amount)()) {                 // @remove-line
            balances[msg.sender] = amount;                      // @remove-line
        }                                                       // @remove-line
    }
}

contract SecureBalancesWithSend is Balances {
    function withdraw() public {
        // change code so it is not vulnerable using send
        if (msg.sender.send(balances[msg.sender])) {            // @remove-line
            balances[msg.sender] = 0;                           // @remove-line
        }                                                       // @remove-line
    }
}

contract SecureBalancesWithTransfer is Balances {
    function withdraw() public {
        // change code so it is not vulnerable using transfer
        msg.sender.transfer(balances[msg.sender]);              // @remove-line
        balances[msg.sender] = 0;                               // @remove-line
    }
}
