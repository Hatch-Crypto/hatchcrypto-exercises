pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "./Team.sol";

contract TeamTest {
    Team team = new Team();

    function getName(uint _id) public view returns (string) {
        string memory name;
        (name) = team.members(_id);
        return name;
    }

    function testDefinesMembersMapping() public {
        Assert.equal(getName(0), "", "empty mapping should be declarated");
    }

    function testSetMember() public {
        team.setMember(1009, "Foo");
        Assert.equal(getName(1009), "Foo", "team member name is not correctly set");
    }

    function testGetMemberName() public {
        team.setMember(1010, "Bar");
        Assert.equal(team.getMemberName(1010), "Bar", "getMemberName doesn't return member name");
    }

    function testRemoveMember() public {
        team.setMember(1011, "Baz");
        team.removeMember(1011);
        Assert.equal(getName(1011), "", "team member is not correctly removed");
    }
}
