pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "../contracts/Visibility.sol";


contract VisibilityTest is Visibility {
    Visibility instance = new Visibility();

    function isExternallyVisible(bytes4 _signature) public returns (bool) {
        return address(instance).call(_signature);
    }

    function testKeepMeDefault() public {
        bool isExternal = isExternallyVisible(bytes4(keccak256("keepMeDefault()")));
        Assert.equal(isExternal, false, "keepMeDefault is externally accessible");
        Assert.equal(keepMeDefault, 0, "keepMeDefault is not equal do its default value"); // checks if compiles
    }

    function compilesMakeMeVisibleCall() pure public {
        makeMeVisible();
    }

    function testMakeMeVisible() public {
        bool isExternal = isExternallyVisible(bytes4(keccak256("makeMeVisible()")));
        Assert.equal(isExternal, true, "makeMeVisible is not externally accessible");
        bool isInternal = address(this).call(bytes4(keccak256("makeMeVisible()")));
        Assert.equal(isInternal, true, "makeMeVisible is not internally accessible");
    }

    function testMakeMeHiddenFromOthers() public {
        bool isExternal = isExternallyVisible(bytes4(keccak256("makeMeHiddenFromOthers()")));
        Assert.equal(isExternal, false, "makeMeHiddenFromOthers is externally accessible");
        // Notice: Calling private function won't compile :(
    }

    function testMakeMeVisibleOnlyForFunctions() public {
        bool isExternal = isExternallyVisible(bytes4(keccak256("makeMeVisibleOnlyForFunctions()")));
        Assert.equal(isExternal, true, "makeMeHiddenFromOthers is not externally accessible");
        // Notice: Calling external function internally won't compile :(
    }

    function compilesMakeMeVisibleForChildContracts() pure public {
        makeMeVisibleForChildContracts();
    }

    function testMakeMeVisibleForChildContracts() public {
        bool isExternal = isExternallyVisible(bytes4(keccak256("makeMeVisibleForChildContracts()")));
        Assert.equal(isExternal, false, "makeMeVisibleForChildContracts is externally accessible");
    }
}
