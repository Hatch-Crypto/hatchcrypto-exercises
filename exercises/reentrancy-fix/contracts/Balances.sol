pragma solidity 0.4.23;


contract Balances {
    mapping(address => uint) public balances;

    function deposit() public payable {
        require(msg.value > 1 finney);
        balances[msg.sender] += msg.value;
    }
}
