# Low-level Call - Playing with Function Signatures

## Keccak-256

On October 2, 2012, Keccak was selected as the winner of the NIST hash function competition to create a new hash standard, SHA-3.

```
keccak256("Vitalik", 10); // (bytes32) 0x3429ccee6b7be5809f2b3d97d0743c7c488ce3f4479b077d5359ad8a5c8dab44
```

Calling `keccak256(...)` with arbitrary number of arguments returns Ethereum-SHA-3 (Keccak-256) hash.

## Function Selector

The first four bytes of the call data for a function call specifies the function to be called. It is the first four bytes of the Keccak (SHA-3) hash of the signature of the function.

```
addr.call(bytes4(keccak256("someFunction(bytes32)")), someArgument);
```

You can calculate and use function selector in Solidity. The low-level `address.call` is the only way to tell whether execution succeeded (`true`) or failed (`false`). Errors won't bubble up.

## Reference

* https://en.wikipedia.org/wiki/SHA-3
* http://solidity.readthedocs.io/en/v0.4.24/abi-spec.html#function-selector
