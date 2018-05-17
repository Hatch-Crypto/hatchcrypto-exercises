# Destruct - Delegated pruning

## selfdestruct

Selfdestruct destroys the contract and forces ether transfer to the designated address. You can notice how test contract gets ether back despite not implementing payable fallback function.

```
selfdestruct(recipient_addr);
```

## delegatecall

DELEGATECALL is considered a potential security risk and opens a vector for an attack. It was a fix for the CALLCODE that doesn’t preserve `msg.sender` or `msg.value`. It allows delegate to perform arbitrary operation.

Exercise shows how irresponsible use of `delegatecall` leads to destroying contract together with losing entire balance.

```
addr.delegatecall(bytes4(keccak256("someFunction(bytes32)")), someArgument);
```

`delegatecall` accepts the same set of arguments as `call` and also returns `false` on failure

## Reference

* https://solidity.readthedocs.io/en/v0.4.23/introduction-to-smart-contracts.html#self-destruct
* https://solidity.readthedocs.io/en/v0.4.23/units-and-global-variables.html#address-related
