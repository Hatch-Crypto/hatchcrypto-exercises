# Reentrancy - Prevention

Since you've executed the successful attack and understand how each of methods for transferring funds works, you can implement a fix for each method.

Securing contract using `address.send` or `address.transfer` is relatively easy.

Hint for securing contract that use `address.call.value()`: Set sender's balance before transfering funds.

## Prerequisites

Copy `Balances.sol` from `payable` exercise to `contracts` directory.

```
cd exercises/reentrancy-fix/
cp ../payable/contracts/Balances.sol contracts/
cp ../reentrancy/contracts/Reentrancy.sol contracts/
```

## Reference

* http://hackingdistributed.com/2016/06/18/analysis-of-the-dao-exploit/
