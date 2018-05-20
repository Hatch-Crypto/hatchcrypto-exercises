# State Change - Counter Incrementation

## Transaction

A transaction is a message that is sent from one account to another account. It can include binary data (its payload) and Ether.

If the target account contains code, that code is executed and the payload is provided as input data.

In this exercise, `reset()` or `tick()` execution is a transaction.

## Gas

Each transaction is charged with a certain amount of gas. EVM executes the transaction, gas is gradually depleted according to rules in [yellowpaper.io](http://yellowpaper.io/) (page 20).

Unused gas is immediately refunded.

Transaction fee in ETH is `gas_price * gas`, `gas_price` is set by the creator of the transaction.

## Storage

Each contract has persistent state called **storage** (key-value store that maps 256-bit words to 256-bit words). It's relatively expensive to write to storage. Are you able find in [yellowpaper.io](http://yellowpaper.io/) how much it costs?

## Call

Calls are executed locally by Ethereum node and don't require verification through blockchain consensus. You can think about calls as read-only transactions. Calls are free to make.

In this exercise, `count()` execution is a call.

## Scoping and Declarations

A variable which is declared will have an initial default value whose byte-representation is all zeros:

```
bool      // false
int       // 0
uint      // 0
bytes     // []
```

Solidity inherits its scoping rules from JavaScript. Solidity inherits its scoping rules from JavaScript. It works like each variable is was declared with var keyword and is hoisted.

## Important Links

* [ETH Gas Station](https://ethgasstation.info/) - consumer oriented metrics for Ethereum gas
* [Etherscan](https://etherscan.io/) - the most important block explorer for Ethereum

## Reference

* http://solidity.readthedocs.io/en/v0.4.23/introduction-to-smart-contracts.html
* http://solidity.readthedocs.io/en/v0.4.23/control-structures.html
