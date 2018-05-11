pragma solidity 0.4.23;


contract FunctionSignature {
    function moreThanFive(uint _value) public pure {
        require(_value > 5);
    }

    function isMoreThanFive(uint _value) public returns (bool) {
        // return true if calling moreThanFive succeeded and false if it failed
        // create function signature and pass _value as an argument
        return address(this).call(bytes4(keccak256("moreThanFive(uint256)")), _value); // @remove-line
    }
}
