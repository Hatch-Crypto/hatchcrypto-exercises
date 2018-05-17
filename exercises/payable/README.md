# Payable - Work With Value

## Ether Units

There are multiple subdenominations of Ether. You can use them to avoid working with multiple zeros in literal numbers. Ether value without postfix is assumed to be Wei.

* 1 `ether` is 10^18 `wei`
* 1 `finney` is 10^15 `wei`
* 1 `szabo` is 10^12 `wei`

## Payable

Functions that accept Ether transfer requires `payable` modifier. Payable modifier can be applied to constructor to create contract with balance, to regular function, or to fallback function to accept regular transfers.

```
constructor() payable public {}
function buyToken() payable public {}
function () public payable {}
```

## Reference

* http://solidity.readthedocs.io/en/v0.4.23/units-and-global-variables.html#ether-units
* http://solidity.readthedocs.io/en/v0.4.23/frequently-asked-questions.html#what-happens-if-you-send-ether-along-with-a-function-call-to-a-contract
