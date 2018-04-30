pragma solidity 0.4.23;


contract Balances {
  mapping(address => uint) public balances;

  // allow contract to accept funds upon creation
  constructor() public payable {}                   // @remove-line

  // implement deposit() function and track users balances, value has to be greater than 1 finney
  function deposit() public payable {               // @remove-line
    require(msg.value > 1 finney);                  // @remove-line
    balances[msg.sender] += msg.value;              // @remove-line
  }                                                 // @remove-line
}
