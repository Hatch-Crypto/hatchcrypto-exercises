pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "./Airdrop.sol";

contract AirdropTest {
    Airdrop airdrop = new Airdrop();
    address constant ADDR1 = 0x627306090abaB3A6e1400e9345bC60c78a8BEf57;
    address constant ADDR2 = 0xf17f52151EbEF6C7334FAD080c5704D77216b732;
    event Suppress(bool value);

    function beforeEach() public {
        emit Suppress(address(airdrop).call(bytes4(keccak256("addAddress")), ADDR1));
    }

    function testNewAddingAddress() public {
        airdrop.addAddress(ADDR1);
        Assert.equal(airdrop.isSet(ADDR1), true, "address doesn't exists after it was set");
    }

    function testPreventingFromAddingSameAddress() public {
        bool result = address(airdrop).call(bytes4(keccak256("addAddress")), ADDR1);
        Assert.equal(result, false, "its doesn't fail when adding the same address twice");
    }

    function testAirdrop() public {
        airdrop.airdrop(100);
        airdrop.addAddress(ADDR2);
        airdrop.airdrop(50);
        Assert.equal(airdrop.balances(ADDR2), 50, "balance is invalid after 1 airdrop");
        Assert.equal(airdrop.balances(ADDR1), 150, "balance is invalid after 2 airdrops");
    }

    function testRemovingAddress() public {
        airdrop.removeAddress(ADDR1);
        Assert.equal(airdrop.isSet(ADDR1), false, "address is set after it was removed");
        Assert.equal(airdrop.balances(ADDR1), 0, "balance is not 0 after address was removed");
    }
}
