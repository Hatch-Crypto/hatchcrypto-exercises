# First Library - Using libraries as modules and for types

## Libraries

Libraries are deployed only once at a specific address and their code is reused using the `DELEGATECALL`. Libraries are assumed to be stateless.

```
library MathOperationsLib {
  ...
}
```

`internal` functions (like in popular [SafeMath](https://github.com/OpenZeppelin/openzeppelin-solidity/blob/master/contracts/math/SafeMath.sol)) are pulled into the calling contract at the compile time and regular `JUMP` call is used instead of `DELEGATECALL`

```
function sub(uint256 a, uint256 b) internal pure returns (uint256) {
  assert(b <= a);
  return a - b;
}
```

## Usage

You can use a library similarly to how you use contracts in your code but without instantiation.

```
uint result = MyLib.myFunction(101);
```

The directive `using A for B;` can be used to attach library functions (from the library `A`) to any type (`B`).

```
using MyLib for uint;

uint result = uint(100).myFunction();
```

## Resources

* http://solidity.readthedocs.io/en/v0.4.24/contracts.html#libraries
