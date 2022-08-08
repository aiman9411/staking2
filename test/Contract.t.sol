// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/Contract.sol";
import "src/MockToken.sol";

contract ContractTest is Test {
    Staking public staking;
    MockToken public tokenOne;
    MockToken public tokenTwo;

    function setUp() public {
        tokenOne = new MockToken();
        tokenTwo = new MockToken();
        staking = new Staking(address(tokenOne), address(tokenTwo));
    }

    
}
