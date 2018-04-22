pragma solidity 0.4.23;

contract Team {
    struct Member {
        string name;
    }

    // create public mapping that maps mamber id (uint) to a Member
    mapping(uint => Member) public members;                               // @remove-line

    // create setMember for adding a new member that accepts _id, name and position as arguments
    function setMember(uint _id, string _name) public {                   // @remove-line
        members[_id] = Member(_name);                                     // @remove-line
    }                                                                     // @remove-line

    // create getMemberName that returns name of the member by id
    function getMemberName(uint _id) public view returns (string) {       // @remove-line
        return members[_id].name;                                         // @remove-line
    }                                                                     // @remove-line

    // create removeMember that "removes" member by id
    function removeMember(uint _id) public {                              // @remove-line
        delete members[_id];                                              // @remove-line
    }                                                                     // @remove-line
}
