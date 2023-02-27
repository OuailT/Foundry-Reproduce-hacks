// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import { MyToken } from "../src/MyToken.sol";

// forge script script/Counter.s.sol:CounterScript --fork-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

contract ERC721Script is Script {
    function setUp() public {
    }

    function run() public {
        vm.startBroadcast();
        new MyToken();
        vm.stopBroadcast();
    }
}
