# Events - Adding Events for Airdrop

## Logs

Ethereum blockchain log is a part of blockchain state (see [badass graph](https://ethereum.stackexchange.com/a/6413)). It's an indexed, cheap, and persistent storage that is unaccessible by smart contracts but can be read via JSON-RPC.

Solidity provides a low-level interface to write to logs: `log0`, `log1`, `log2`

## Events

Event is an abstraction on top of the EVM logging facilities. Emitting event can trigger event listeners on the client side. Part of the log data is stored in [bloom filter](https://en.wikipedia.org/wiki/Bloom_filter), arguments can be `indexed` and filtered.

```
event Donated(address indexed donator, uint value);

function () public payable {
    emit Donated(msg.sender, msg.value);
}
```

Fallback function gas stipend is enough to emit an event (this one costs only 1166 gas).

## Reference

* https://ethereum.stackexchange.com/questions/268/ethereum-block-architecture
* https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getlogs
* https://solidity.readthedocs.io/en/v0.4.24/contracts.html#events
