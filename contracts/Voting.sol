// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Candidate {
        string name;
        uint voteCount;
    }

    Candidate[] public candidates;

    function addCandidate(string memory name) public {
        candidates.push(Candidate(name, 0));
    }

    function vote(uint index) public {
        require(index < candidates.length, "Invalid candidate index");
        candidates[index].voteCount++;
    }

    function getCandidate(uint index) public view returns (string memory, uint) {
        require(index < candidates.length, "Invalid candidate index");
        Candidate memory c = candidates[index];
        return (c.name, c.voteCount);
    }

    function candidatesCount() public view returns (uint) {
        return candidates.length;
    }
}
