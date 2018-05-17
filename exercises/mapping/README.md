# Mapping - Team Members

Mapping is a type that maps a simple type eg. uint, bytes32 to any type (including other mappings).

```
mapping(address => uint) public balances;
```

Getter generated for a public mapping accepts a key as an argument and returns corresponding value.
