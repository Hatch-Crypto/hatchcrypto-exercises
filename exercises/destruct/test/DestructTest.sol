pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "../contracts/Destruct.sol";


contract DestructTest {
    uint public initialBalance = 1 ether;
    uint startBalance;
    DelegatedDestruct delegate = new DelegatedDestruct();

    function beforeEach() public {
        startBalance = address(this).balance;
    }

    function testPrune() public {
        Destruct instance = new Destruct(delegate);
        address(instance).transfer(0.1 ether);
        instance.prune(address(this));
        Assert.equal(address(this).balance, startBalance, "funds not returned after pruning");
    }

    function testPreventPruneToZeroAddress() public {
        Destruct instance = new Destruct(delegate);
        address(instance).transfer(0.1 ether);
        bool result = address(instance).call(bytes4(keccak256("prune(address)")), 0);
        Assert.equal(result, false, "doesn't prevent from calling prune with 0 address");
        Assert.equal(address(instance).balance, 0.1 ether, "balance after failed prune changed");
    }

    function testDelegatedPrune() public {
        Destruct instance = new Destruct(delegate);
        address(instance).transfer(0.1 ether);
        instance.delegatePrune(address(this));
        Assert.equal(address(this).balance, startBalance, "funds not returned after delegated pruning");
    }

    function testPreventDelegatePruneToZeroAddress() public {
        Destruct instance = new Destruct(delegate);
        address(instance).transfer(0.1 ether);
        bool result = address(instance).call(bytes4(keccak256("delegatePrune(address)")), 0);
        Assert.equal(result, false, "doesn't prevent from calling delegated prune with 0 address");
        Assert.equal(address(instance).balance, 0.1 ether, "balance after failed delegated prune changed");
    }
}
