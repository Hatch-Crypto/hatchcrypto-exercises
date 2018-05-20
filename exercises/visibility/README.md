# Visibility - From Public to Private

## Visibility Specifiers

There are four visibility specifiers for function and state variables.

| Specifier  | Description                                                                         |
|------------|-------------------------------------------------------------------------------------|
| `external` | can be called only from other contracts and via transactions, part of the interface |
| `public`   | can be called internally or via messages (externally), part of the interface        |
| `internal` | can be called only internally from current and deriving contracts                   |
| `private`  | can be called only internally from current contract                                 |

Functions default to `public` and state variables to `internal` visibility.

## Reference

* http://solidity.readthedocs.io/en/v0.4.24/contracts.html#visibility-and-getters
* https://twitter.com/MichalZalecki/status/981775402124398592
