# Struct - Team Manager

Struct is custom defined type that can group several variables.

```
struct Funder {
  address addr;
  uint amount;
}
```

Order of fields in the struct type is relevant during initialization.

```
Funder funder = Funder(msg.sender, msg.value);
```

You can also initialize struct using named parameters.

```
Funder funder = Funder({ addr: msg.sender, amount: msg.value });
```

## Reference

* http://solidity.readthedocs.io/en/v0.4.23/types.html#structs
