<img align="right" width="150" height="150" top="100" src="./assets/protected.png">

# protec • [![ci](https://github.com/abigger87/protec/actions/workflows/ci.yaml/badge.svg?label=ci)](https://github.com/abigger87/protec/actions/workflows/ci.yaml) [![license](https://img.shields.io/badge/License-Apache_2.0-blue.svg?label=license)](https://opensource.org/licenses/Apache-2.0) [![size](https://img.shields.io/github/languages/code-size/abigger87/protec.svg?color=orange&label=size)](https://img.shields.io/github/languages/code-size/abigger87/protec?label=size)

Safely Execute Foreign Function Interface Commands.


> **Warning**
>
> This repo contains **highly** experimental code. Expect rapid iteration.
>
> The current implementation does not currently work since environment variables are not refreshed.


## What?

**protec** is a wrapper to prevent library abuse of the [foundry](https://github.com/foundry-rs/foundry)'s [ffi](https://book.getfoundry.sh/cheatcodes/ffi.html) command. It attempts to completely block any call by setting the `FOUNDRY_FFI` environment variable to `false`.


## Installation

```
forge install abigger87/protec
```

## Usage


1. Add this import to your script or test:
```solidity
import {Protec} from "protec/Protec.sol";
```

2. Inherit the Protec contract (eg in a test):
```solidity
contract MyContract is Test, Protec {
  // ...
}
```

3. That's it! Any call to `vm.ffi` that libraries perform will revert.


## Acknowledgements

- [Unix](https://github.com/abigger87/unix)
- [Shannon](https://github.com/abigger87/shannon) _SOON™_
- [Surl](https://github.com/memester-xyz/surl)
- [Solenv](https://github.com/memester-xyz/solenv)
