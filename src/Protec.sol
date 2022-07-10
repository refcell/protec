// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import {Vm} from "forge-std/Vm.sol";
import {strings} from "strings/strings.sol";

contract Protec {
  using strings for *;

  modifier unsafe() {
    Vm tvm = Vm(address(bytes20(uint160(uint256(keccak256("hevm cheat code"))))));

    bool init_ffi = false;
    try tvm.envBool("FOUNDRY_FFI") returns (bool ffi) {
      ffi = init_ffi;
    } catch (bytes memory reason) {
      // Try to read "ffi" from the foundry toml
      string memory toml = tvm.readFile("foundry.toml");
      strings.slice memory s = toml.toSlice();
      if (s.contains("ffi=".toSlice())) {
        s.split("ffi=".toSlice());
        init_ffi = s.split("\n".toSlice()).equals("true".toSlice());
      } else if (s.contains("ffi =".toSlice())) {
        s.split("ffi =".toSlice());
        init_ffi = s.split("\n".toSlice()).equals("true".toSlice());
      }
    }

    // Set the ffi env var
    tvm.setEnv("FOUNDRY_FFI", "false");
    _;
    if (init_ffi) {
      tvm.setEnv("FOUNDRY_FFI", "true");
    } else {
      tvm.setEnv("FOUNDRY_FFI", "false");
    }

  }

  function safe(function() internal func) internal unsafe {
    func();
  }
}
