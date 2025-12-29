// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {DeployToken} from "script/DeployToken.s.sol";
import {MyToken} from "src/MyToken.sol";

contract TestMyToken is Test {
    MyToken myToken;
    DeployToken deployToken;

    address faker = makeAddr("faker");
    address noah = makeAddr("noah");

    uint256 constant STARTING_BALANCE = 10 ether;
    function setUp() public {
        deployToken = new DeployToken();
        myToken = deployToken.run();

        vm.prank(msg.sender);
        myToken.transfer(faker, STARTING_BALANCE);
    }

    function test_fakerBalance() public view {
        assert(myToken.balanceOf(faker) == STARTING_BALANCE);
    }

    function test_allowances() public {
        vm.prank(faker);
        myToken.approve(noah, STARTING_BALANCE);

        uint256 transferFormBalance = 1 ether;
        vm.prank(noah);
        myToken.transferFrom(faker, noah, transferFormBalance);

        assertEq(myToken.balanceOf(noah),transferFormBalance);
        assertEq(myToken.balanceOf(faker), STARTING_BALANCE - transferFormBalance);

    }
}
