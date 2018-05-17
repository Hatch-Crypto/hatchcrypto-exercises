# Deposit - Allocate and Withdraw Funds

In the previous exercise (*Payable - Work With Value*), you have learned about possible usage of `payable` modifier. You will put this knowledge into practice in this exercise.

## Inheritance

Solidity supports multiple inheritance using C3 linearization (like in Python). In this exercise, we will inherit from only one contract which we created previously.

```
contract Deposit is Ownable {
  ...
}
```

## Prerequisites

Copy `Ownable.sol` from `ownable` exercise to `contracts` directory.

```
cd exercises/deposit/
cp ../ownable/contracts/Ownable.sol contracts/
```

## Reference

* http://solidity.readthedocs.io/en/v0.4.23/contracts.html#inheritance
