// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";

library Protec {
  function ffi(string memory input) public returns (bytes memory ffi_res) {
    console2.log("[BLOCKED FFI CALL]");
    bytes memory encoded = abi.encode(0, "BLOCKED_FFI_CALL");
    (uint256 success, bytes memory res) = abi.decode(encoded, (uint256, bytes));
    console2.log(string.concat("Is success: ", string(abi.encode(success))));
    return encoded;
  }
}
