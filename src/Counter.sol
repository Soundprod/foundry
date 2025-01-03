// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;
    address public immutable owner;

    constructor(){ 
	owner = tx.origin;
    }

    modifier onlyOwner() {
	require(msg.sender == owner, "Not an owner!");
	_;
    }

    event NumberChanged(uint256 newNumber);

    function setNumber(uint256 newNumber) public onlyOwner {
        number = newNumber;
	emit NumberChanged(newNumber);
    }

    function increment() public {
        number++;
    }
}
