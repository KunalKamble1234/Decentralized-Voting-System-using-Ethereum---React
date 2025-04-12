// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    address public owner;

    struct Candidate {
        string name;
        uint voteCount;
    }

    Candidate[] public candidates;

    mapping(address => bool) public registeredVoters; // ✅ Only registered users can vote
    mapping(address => bool) public hasVoted; // ✅ Prevent double voting

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    modifier onlyRegistered() {
        require(registeredVoters[msg.sender], "You are not registered to vote");
        _;
    }

    function addCandidate(string memory name) public onlyOwner {
        candidates.push(Candidate(name, 0));
    }

    function registerVoter(address voter) public onlyOwner {
        registeredVoters[voter] = true;
    }

    function vote(uint index) public onlyRegistered {
        require(index < candidates.length, "Invalid candidate index");
        require(!hasVoted[msg.sender], "You have already voted");

        candidates[index].voteCount++;
        hasVoted[msg.sender] = true;
    }

    function getCandidate(uint index) public view returns (string memory, uint) {
        require(index < candidates.length, "Invalid candidate index");
        Candidate memory c = candidates[index];
        return (c.name, c.voteCount);
    }

    function candidatesCount() public view returns (uint) {
        return candidates.length;
    }

    function isRegistered(address voter) public view returns (bool) {
        return registeredVoters[voter];
    }

    function hasAlreadyVoted(address voter) public view returns (bool) {
        return hasVoted[voter];
    }
}
