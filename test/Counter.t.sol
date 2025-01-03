// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";
import {CounterScript} from "../script/Counter.s.sol";

contract CounterTest is Test {
    Counter public counter;
    CounterScript public script;

    function setUp() public {
	script = new CounterScript();
	/*
	address script_address = address(script);
	vm.prank(script_address);
	*/
        counter = script.run();
	//console.log(address(script));
	//console.log(address(counter));
        //counter.setNumber(0);
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function test_OwnerIsScript() public {
	//address script_address = address(script);
	//vm.prank(script_address);
	console.log("msg.sender: ", msg.sender);
	console.log("tx.origin: ", tx.origin);
	console.log("address(this): ", address(this));
	assertEq(counter.owner(), tx.origin);
    }

    function testFuzz_SetNumber(uint256 x) public {
	vm.expectRevert();
        counter.setNumber(x);
        //assertEq(counter.number(), x);
    }
}
