# Reentrancy - Exploit (DAO-like Hack)

## Sending Funds

There are three ways to transfer funds programmatically in Solidity.

```
address.transfer(amount);                  // throws on failure, uses 2300 gas limit

address.send(amount);                      // returns false on failure, uses 2300 gas limit

address.call.value(amount)();              // returns false on failure, forwards gas
address.call.value(amount).gas(limit)();   // allows to set custom amount of gas
```

## Reentrancy Attack

Transfer of funds immediately calls a fallback function. This creates an attack vector. If calling contract state is not modified to account for already sent funds, the malicious contract can drain all the funds.

In this exercise, you will implement a malicious contract that can be used to execute the attack. In the next exercise, you will learn how to secure the contract that uses each method of transferring funds.

## Prerequisites

Copy `Balances.sol` from `payable` exercise to `contracts` directory.

```
cd exercises/reentrancy/
cp ../payable/contracts/Balances.sol contracts/
```

## Reference

* http://hackingdistributed.com/2016/06/18/analysis-of-the-dao-exploit/
