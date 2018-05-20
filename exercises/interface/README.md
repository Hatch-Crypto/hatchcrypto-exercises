# Interface - Base ERC-20 Token

## Interface

Interfaces are denoted by `interface` keyword. Cannot have any function implemented, cannot define custom types, nor inherit other constructor and interfaces. Can define events.

```
interface ERC20 {
    function transfer(address recipient, uint amount) public;
    event Transfer(address indexed from, address indexed to, uint256 value);
}
```

## Abstract contract

Contracts are marked as abstract when at least one of their functions lacks an implementation. Such contracts cannot be instantiated by can be inherited.

## Reference

* http://solidity.readthedocs.io/en/v0.4.24/contracts.html#interfaces
* http://solidity.readthedocs.io/en/v0.4.24/contracts.html#abstract-contracts
