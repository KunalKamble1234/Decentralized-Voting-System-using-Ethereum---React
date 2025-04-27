// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    address public owner;

    struct Candidate {
        string name;
        uint voteCount;
    }

    struct VoteRecord {
        address voter;
    }

    Candidate[] public candidates;
    VoteRecord[] public voteLedger;

    mapping(address => bool) public hasVoted;

    event Voted(address indexed voter);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    function addCandidate(string memory name) public onlyOwner {
        candidates.push(Candidate(name, 0));
    }

    function vote(uint index) public {
        require(index < candidates.length, "Invalid candidate index");
        require(!hasVoted[msg.sender], "You have already voted");

        candidates[index].voteCount++;
        hasVoted[msg.sender] = true;

        voteLedger.push(VoteRecord(msg.sender));

        emit Voted(msg.sender);
    }

    function getCandidate(uint index) public view returns (string memory, uint) {
        require(index < candidates.length, "Invalid candidate index");
        Candidate memory c = candidates[index];
        return (c.name, c.voteCount);
    }

    function candidatesCount() public view returns (uint) {
        return candidates.length;
    }

    function hasAlreadyVoted(address voter) public view returns (bool) {
        return hasVoted[voter];
    }

    function totalVotes() public view returns (uint) {
        return voteLedger.length;
    }

    function getVoteRecord(uint index) public view returns (address) {
        require(index < voteLedger.length, "Invalid vote record index");
        return voteLedger[index].voter;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner is the zero address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}
