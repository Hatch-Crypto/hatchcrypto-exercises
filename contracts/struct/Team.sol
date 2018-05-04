pragma solidity 0.4.23;

contract Team {
    // define a Manager type as struct with name (string) and score (uint)
    struct Manager {                                            // @remove-line
        string name;                                            // @remove-line
        uint score;                                             // @remove-line
    }

    // declare manager variable of type Manager
    Manager manager;                                            // @remove-line

    // initialize manager witin public setManager function that accepts name and score as arguments
    function setManager(string _name, uint _score) public {     // @remove-line
        manager = Manager(_name, _score);                       // @remove-line
    }                                                           // @remove-line


    // create increaseManagerScore that accepts number of scores to add to manager.score
    function increaseManagerScore(uint _by) public {            // @remove-line
        manager.score += _by;                                   // @remove-line
    }                                                           // @remove-line
}
