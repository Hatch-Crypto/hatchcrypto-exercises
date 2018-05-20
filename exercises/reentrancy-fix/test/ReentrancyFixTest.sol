pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "../contracts/ReentrancyFix.sol";
import "../contracts/Reentrancy.sol";


contract ReentrancyFixTest {
    uint public initialBalance = 1 ether;

    function () public payable {}

    function testAttacker() public {
        VulnerableBalances balances = new VulnerableBalances();
        balances.deposit.value(100 finney)();
        Attacker attacker = (new Attacker).value(2 finney)(balances);
        attacker.start();

        Assert.equal(address(attacker).balance, 102 finney, "attacker contract doesn't work");
    }

    function testSecureBalancesWithCallValue() public {
        SecureBalancesWithCallValue balances = new SecureBalancesWithCallValue();
        uint initBalance = address(this).balance;
        balances.deposit.value(10 finney)();
        balances.withdraw();
        Assert.equal(address(this).balance, initBalance, "withdrawal doesn't work");
    }

    function testSecureBalancesWithCallValueMalicious() public {
        SecureBalancesWithCallValue balances = new SecureBalancesWithCallValue();
        balances.deposit.value(100 finney)();
        Attacker attacker = (new Attacker).value(2 finney)(VulnerableBalances(balances));
        attacker.start();

        Assert.isAtMost(address(attacker).balance, 2 finney, "is vulnerable");
    }

    function testSecureBalancesWithSend() public {
        SecureBalancesWithSend balances = new SecureBalancesWithSend();
        uint initBalance = address(this).balance;
        balances.deposit.value(10 finney)();
        balances.withdraw();
        Assert.equal(address(this).balance, initBalance, "withdrawal doesn't work");
    }

    function testSecureBalancesWithSendMalicious() public {
        SecureBalancesWithSend balances = new SecureBalancesWithSend();
        balances.deposit.value(100 finney)();
        Attacker attacker = (new Attacker).value(2 finney)(VulnerableBalances(balances));
        attacker.start();

        Assert.equal(address(attacker).balance, 0, "attacker balance has changed");
    }

    function testSecureBalancesWithTransfer() public {
        SecureBalancesWithTransfer balances = new SecureBalancesWithTransfer();
        balances.deposit.value(100 finney)();
        Attacker attacker = (new Attacker).value(2 finney)(VulnerableBalances(balances));

        bool result = address(attacker).call(bytes4(keccak256("start()")));
        Assert.equal(result, false, "attack attempt did not revert");
        Assert.equal(address(attacker).balance, 0, "attacker balance has changed");
    }
}
