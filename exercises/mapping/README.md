# Mapping - Team Members

## Mapping

Mapping is a type that maps a simple type eg. uint, bytes32 to any type (including other mappings).

```
mapping(address => uint) public balances;
```

Getter generated for a public mapping accepts a key as an argument and returns corresponding value.

## delete

`delete A` assigns the initial value for the fiven type `A`

* for integers: 0
* for dynamic arrays: dynamic array of length zero
* for static arrays: static arrays of the same length with all elements reset
* for structs: struct with all members reset

## Reference

* http://solidity.readthedocs.io/en/v0.4.24/types.html#mappings
* http://solidity.readthedocs.io/en/v0.4.24/types.html#delete
