pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "./Team.sol";

contract TeamTest is Team {
    function testManagerDeclaration() public {
        Assert.equal(manager.name, "", "manager declaration should have empty name");
        Assert.equal(manager.score, 0, "manager declaration should have 0 score");
    }

    function testSettingManager() public {
        setManager("Foo", 102);
        Assert.equal(manager.name, "Foo", "setting manager name failed");
        Assert.equal(manager.score, 102, "setting manager score failed");
    }

    function testIncreaseingManagerScore() public {
        uint initialScore = manager.score;
        increaseManagerScore(10);
        Assert.equal(manager.score, initialScore + 10, "setting manager score failed");
    }
}
