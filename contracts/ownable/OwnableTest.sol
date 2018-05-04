pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "./Ownable.sol";

contract OwnableTest {
    address constant ADDR = 0x627306090abaB3A6e1400e9345bC60c78a8BEf57;
    Ownable ownable;

    function beforeEach() public {
        ownable = new Ownable();
    }

    function testSettingOwner() public {
        Assert.equal(ownable.owner(), address(this), "owner address is invalid");
    }

    function testTransferingOwnership() public {
        ownable.transferOwnership(ADDR);
        Assert.equal(ownable.owner(), ADDR, "transfering ownership failed");
    }

    function testPreventTransferingOwnershipByNonOwner() public {
        ownable.transferOwnership(ADDR);
        bytes4 signature = bytes4(keccak256("transferOwnership(address)"));
        bool result = address(ownable).call(signature, address(this));
        Assert.equal(result, false, "non-owner can call transfer ownership");
    }
}
