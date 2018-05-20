# Enum - Crowdsale stages

## Enum

Struct is the one way to create a user-defined type in Solidity. Enums is the other way.

```
enum Direction {
  Left,
  Right,
  Backward,
  Forward
}

Direction direction = Direction.Backward;
```

Enums are explicitly convertible to and from integer types.

```
uint d = uint(direction);
direction = Direction(2);
```

## Reference

* http://solidity.readthedocs.io/en/v0.4.24/types.html#enums
