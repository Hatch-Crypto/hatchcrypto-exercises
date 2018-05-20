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

## Address Balance

It's possible to query the balance of an address using the property `balance`. You can also sent Ether to an address using `transfer`.

```
addr.balance                           // address balance in Wei (uint)
addr.transfer(1000000000000000000)     // send 1 Ether (10^18 Wie)
```

Contract instance is implicitly convertible to its address.

```
address(this).balance            // get the balance of the current contract
address(myContract).balance      // get the balance of the external address
```

## Reference

* http://solidity.readthedocs.io/en/v0.4.23/contracts.html#inheritance
* http://solidity.readthedocs.io/en/v0.4.24/types.html#members-of-addresses
* http://solidity.readthedocs.io/en/v0.4.24/contracts.html#creating-contracts
