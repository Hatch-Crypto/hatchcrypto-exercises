# Third Party Libraries - SafeMath and StringUtils

## Community Libraries

Open Source community created many libraries that are meant to speed up the development and share established best practices, so you don't have to reinvent the wheel.

One of the most popular libraries is [openzeppelin-solidity](https://github.com/OpenZeppelin/openzeppelin-solidity) that can be installed via npm. Truffle can import libraries from `node_modules`.

```
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
```

If you are using Remix IDE then remote imports from GitHub are possible.

```
import "github.com/OpenZeppelin/openzeppelin-solidity/contracts/ownership/Ownable.sol";
```

## Prerequisites

Install dependencies via `npm install`
