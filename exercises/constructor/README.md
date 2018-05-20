# Constructor - Counter Initialization

## Constructor

Since Solidity 0.4.22, you can use new constructor keyword.

```
contract Ownable {
  // New-style constructor
  constructor() public { ... }

  // Old-style constructor
  function Ownable() public { ... }

  // Huge mistake! Everyone can call Ownable.constructor
  function constructor() public { ... }
}
```

In Solidity 0.4.22, if a contract has both a new-style constructor and an old-style constructor at the same time, one of them will be ignored (the one defined later in the code).

Since Solidity 0.4.23, more than one constructor results in the compilation error.

## Reference

* http://solidity.readthedocs.io/en/v0.4.24/contracts.html#creating-contracts
