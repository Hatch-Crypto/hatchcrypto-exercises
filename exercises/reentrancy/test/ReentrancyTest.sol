pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "../../reentrancy/contracts/Reentrancy.sol";


contract ReentrancyTest {
    uint public initialBalance = 1 ether;
    VulnerableBalances balances;
    Attacker attacker;

    function testPreparations() public {
        balances = new VulnerableBalances();
        balances.deposit.value(100 finney)();

        attacker = (new Attacker).value(2 finney)(balances);

        Assert.equal(address(attacker).balance, 0, "attacket didn't deposit his balance");
        Assert.equal(address(balances).balance, 102 finney, "balances didn't accept deposit");
    }

    function testAttack() public {
        attacker.start();
        Assert.equal(address(attacker).balance, 102 finney, "You ain't rich! No lambo for you!");
    }
}
