pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "./TimedVoting.sol";


contract TimedVotingTest {
    address[] candidates;
    address[] voters;
    address constant ADDR = 0x627306090abaB3A6e1400e9345bC60c78a8BEf57;
    address constant ADDR2 = 0xf17f52151EbEF6C7334FAD080c5704D77216b732;
    address constant ADDR3 = 0xC5fdf4076b8F3A5357c5E395ab970B5B54098Fef;
    TimedVoting timedVoting;

    function beforeAll() public {
        candidates.push(ADDR);
        candidates.push(ADDR2);
        voters.push(address(this));
    }

    function testProvisioningVotesMapping() public {
        timedVoting = new TimedVoting(candidates, voters, block.number, block.timestamp + 1 days);

        bool result;
        (, result) = timedVoting.votes(ADDR);
        Assert.equal(result, true, "first candidate is not marked as one");
        (, result) = timedVoting.votes(ADDR2);
        Assert.equal(result, true, "second candidate is not marked as one");
        (, result) = timedVoting.votes(ADDR3);
        Assert.equal(result, false, "non-existing candidate is marked as one");
    }

    function testAllowsToVote() public {
        timedVoting = new TimedVoting(candidates, voters, block.number, block.timestamp + 1 days);

        uint votes;
        bool result = timedVoting.vote(ADDR);
        (votes,) = timedVoting.votes(ADDR);

        Assert.equal(timedVoting.voted(address(this)), true, "voter is not marked already voted");
        Assert.equal(votes, 1, "votes count is incorrect");
        Assert.equal(result, true, "vote doesn't return true");
    }

    function testRequireVotingOnGenuineCandidate() public {
        timedVoting = new TimedVoting(candidates, voters, block.number, block.timestamp + 1 days);
        bool result = address(timedVoting).call(bytes4(keccak256("vote(address)")), ADDR);
        Assert.equal(result, true, "disallows to vote on genuine candidate");
        result = address(timedVoting).call(bytes4(keccak256("vote(address)")), ADDR3);
        Assert.equal(result, false, "allows to vote on non-existing candidate");
    }

    function testPreventFromVotingTwice() public {
        timedVoting = new TimedVoting(candidates, voters, block.number, block.timestamp + 1 days);
        timedVoting.vote(ADDR);
        bool result = address(timedVoting).call(bytes4(keccak256("vote(address)")), ADDR);
        Assert.equal(result, false, "allows to vote twice");
    }

    function testPreventFromVotingBeforeStartBlock() public {
        timedVoting = new TimedVoting(candidates, voters, block.number + 1, block.timestamp + 1 days);
        bool result = address(timedVoting).call(bytes4(keccak256("vote(address)")), ADDR);
        Assert.equal(result, false, "allows voting before start block");
    }

    function testPreventFromVotingAfterBeforeTimestamp() public {
        timedVoting = new TimedVoting(candidates, voters, block.number, block.timestamp - 1);
        bool result = address(timedVoting).call(bytes4(keccak256("vote(address)")), ADDR);
        Assert.equal(result, false, "allows voting after end timestamp");
    }
}
