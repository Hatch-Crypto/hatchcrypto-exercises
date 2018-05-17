# Timed Voting - Block Number and Timestamp

## Time Units

You can use time suffixes that makes is easier to work with time.

```
1 seconds        // 1
60 seconds       // 60
60 minutes       // 3600
24 hours         // 86 400
7 days           // 604 800
1 weeks          // 604 800
```

Gramma is a little poor, but it comes in handy nonetheless.

## Measuring Time

A smart contract can read `block.timestamp` which is a current block timestamp in seconds since Unix epoch.

Block time on Ethereum is [on average](https://etherscan.io/chart/blocktime) about 15 seconds. This allows for a rough estimation for when the given block (`block.number`) is going to be mined.

Miners can influence both the timestamp and the block hash to some degree. You should not rely on timestamp as the source of randomness. You should be fine using `block.timestamp` if you can tolarate ~30s difference.

## Reference

* http://solidity.readthedocs.io/en/v0.4.24/units-and-global-variables.html#time-units
