// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/Contract.sol";
import "src/MockToken.sol";

contract ContractTest is Test {
    Staking public staking;
    MockToken public tokenOne;
    MockToken public tokenTwo;
    uint256 public constant AMOUNT = 1e18;

    function setUp() public {
        tokenOne = new MockToken();
        tokenTwo = new MockToken();
        staking = new Staking(address(tokenOne), address(tokenTwo));
    }

    function testStakeFunction() public {
        tokenOne.approve(address(staking), AMOUNT);
        bool success = staking.stake(AMOUNT);
        assertTrue(success);
    }

    function testWithdrawFunction() public {
        tokenOne.approve(address(staking), AMOUNT);
        staking.stake(AMOUNT);
        bool success = staking.withdraw(AMOUNT);
        assertTrue(success);
    }

    function testUpdateRewardFunction() public {
        tokenTwo.approve(address(staking), AMOUNT);
        bool success = staking.claimReward();
        assertTrue(success);
    }
}
