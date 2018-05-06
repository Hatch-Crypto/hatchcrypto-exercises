pragma solidity 0.4.23;


contract DelegatedDestruct {
    function prune(address _address) public {
        // 1. make sure address is non-zero
        // 2. call selfdestruct and transfer balance
        require(_address != 0);                            // @remove-line
        selfdestruct(_address);                            // @remove-line
    }
}

contract Destruct {
    DelegatedDestruct delegate;
    uint public ping = 1;

    function () public payable {}

    constructor(DelegatedDestruct _delegate) public {
        delegate = _delegate;
    }

    function prune(address _address) public {
        // 1. make sure address is non-zero
        // 2. call selfdestruct and transfer balance
        require(_address != 0);                            // @remove-line
        selfdestruct(_address);                            // @remove-line
    }

    function delegatePrune(address _address) public {
        // 3. implement delegatecall to delegate.prune(address)
        bool result = address(delegate).delegatecall(bytes4(keccak256("prune(address)")), _address);   // @remove-line
        require(result);                                   // @remove-line
    }
}
