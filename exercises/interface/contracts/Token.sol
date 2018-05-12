pragma solidity 0.4.23;


interface ERC20Basic {
    function totalSupply() external view returns (uint256);
    function balanceOf(address who) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
}

contract Token is ERC20Basic {
    mapping(address => uint256) balances;

    uint256 totalSupply_;

    constructor(address _owner, uint _totalSupply) public {
        totalSupply_ = _totalSupply;
        balances[_owner] = _totalSupply;
    }

    // implement totalSupply()
    function totalSupply() public view returns (uint256) {                      // @remove-line
        return totalSupply_;                                                    // @remove-line
    }                                                                           // @remove-line

    // implement transfer()
    function transfer(address _to, uint256 _value) public returns (bool) {      // @remove-line
        require(_to != address(0));                                             // @remove-line
        require(_value <= balances[msg.sender]);                                // @remove-line
        balances[msg.sender] = balances[msg.sender] - _value;                   // @remove-line
        balances[_to] = balances[_to] + _value;                                 // @remove-line
        return true;                                                            // @remove-line
    }                                                                           // @remove-line

    // implement balanceOf()
    function balanceOf(address _owner) public view returns (uint256) {          // @remove-line
        return balances[_owner];                                                // @remove-line
    }                                                                           // @remove-line
}
