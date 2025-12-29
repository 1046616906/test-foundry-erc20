// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {MyToken} from "src/MyToken.sol";

contract DeployToken is Script {
    uint256 public constant INITIAL_SUPPLY = 1000 ether;
    function run() public returns (MyToken) {
        vm.startBroadcast();
        MyToken myToken = new MyToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return myToken;
    }
}
