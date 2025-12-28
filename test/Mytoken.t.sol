// SPDX-License-Inderifier: MIT

pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {DeployToken} from "script/DeployToken.s.sol";
import {MyToken} from "src/MyToken.sol";

contract TestMyToken is Test {
    MyToken mytoken;
    function setup() public {
        DeployToken deployToken = new DeployToken();
        mytoken = deployToken.run();
    }
}
