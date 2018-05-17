# Returning Values - Named and Multiple Returns

Solidity supports returning multiple values using Python-like tuple.

```
string name;
uint age;
(name, age) = getNameAndAge();
```

Values can be returned explicitly using `return` keyword.

```
string name = "Vitalik";
uint age = 24;

function getNameAndAge() view public returns (string, uint) {
  return (name, age);
}
```

The other way to return a value is to assign value to output parameter.

```
function getNameAndAge() view public returns (string name, uint age) {
  name = "Vitalik";
  age = 24;
}
```
