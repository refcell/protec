// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/console2.sol";

import {Surl} from "surl/Surl.sol";
import {Protec} from "src/Protec.sol";

contract ProtectedScript is Script {
    using Protec for *;
    using Surl for *;

    function setUp() public {}

    function run() public {
        // Perform a simple get request
        console2.log("Getting request...");
        (uint256 status, bytes memory data) = "https://httpbin.org/get".get();
        console2.log(string.concat("Status: ", string(abi.encode(status))));
    }
}
