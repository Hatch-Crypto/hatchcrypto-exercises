pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "./Balances.sol";


contract BalancesTest {
    uint public initialBalance = 1 ether;

    function testInitializeWithValue() public {
        Balances instance = (new Balances).value(100 finney)();
        Assert.equal(address(instance).balance, 100 finney, "constructor doesn't accept funds");
    }

    function testDeposit() public {
        Balances instance = new Balances();
        instance.deposit.value(10 finney)();
        Assert.equal(instance.balances(address(this)), 10 finney, "balance is invalid");
        instance.deposit.value(15 finney)();
        Assert.equal(instance.balances(address(this)), 25 finney, "balance is invalid after 2nd deposit");
    }

    function testPreventFrom0ValueDeposit() public {
        Balances instance = new Balances();
        bool result = address(instance).call.value(0)(bytes4(keccak256("deposit()")));
        Assert.equal(result, false, "0 value deposit is allowed");
        result = address(instance).call.value(1.1 finney)(bytes4(keccak256("deposit()")));
        Assert.equal(result, true, "1.1 finney value deposit is disallowed");
    }
}
