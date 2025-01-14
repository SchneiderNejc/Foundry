// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.27;

import {Test, console, stdError} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testFailDecrement() public {
        counter.decrement();
    }

    function testDecrementUnderflow() public {
        vm.expectRevert(stdError.arithmeticError);
        counter.decrement();
    }

    function testDecremetn() public {
        counter.increment();
        counter.increment();
        counter.decrement();
        assertEq(counter.number(), 1);
    }

    function testLogSomething() public {
        console.log("Log something here");

        int x = 1;
        console.logInt(x);
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }
}
