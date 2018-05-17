# Iterable Mapping - Airdrop

## Array

Arrays can by fixed size or dynamic. For storage, array element can be of any type. For memory it cannot be mapping.

```
uint[]        // dynamic size array
uint[5]       // array of size 5
```

```
arr.length    // get number of elements
arr.push(2)   // append element at the end of dynamic array and return the new lenght
```

Getter generated for a public array accepts an index as an argument and returns corresponding value.

## require

Solidity uses state-reverting exceptions to handle errors. Exception undo all changes made in the current call. Transactions are atomic.

```
require(value > 0, "Value must be greater than 0");
```

If condition is not met `require` throws an exception and refunds the remaining gas. You can provide an optional message as a second argument for easier debugging.

## Reference

* http://solidity.readthedocs.io/en/v0.4.23/types.html#arrays
* http://solidity.readthedocs.io/en/v0.4.23/control-structures.html#error-handling-assert-require-revert-and-exceptions
