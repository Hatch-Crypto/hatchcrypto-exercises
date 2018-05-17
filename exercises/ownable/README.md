# Ownable - Own Your Contract

## Transaction Properties

Special variables exist in the global namaspace to provide information about blockchain and transaction ([full list](http://solidity.readthedocs.io/en/v0.4.23/units-and-global-variables.html#block-and-transaction-properties)).

```
msg.sender        // creator of the current transaction
msg.value         // number of wei send with the message (1 ether = 10^18 wei)
block.number      // current block number
block.timestamp   // current block timestamp (alias: now)
```

## Function Modifiers

Function modifier can amend the behaviour of functions in a declarative way. Typical use case is to define a precondition before calling a function.

```
bool open = false;

modifier onlyWhenOpen() {
  require(open == true);
  _;
}

function buyLambo() onlyWhenOpen public {
  ...
}
```

Special symbol `_` indicates where function body is inserted.

## Reference

* http://solidity.readthedocs.io/en/v0.4.23/units-and-global-variables.html
* http://solidity.readthedocs.io/en/v0.4.23/contracts.html#modifiers
