// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Bank {

  uint256 public balance=1240;

  function deposit(uint256 amount) public {
    require(amount > 0, "Amount must be greater than 0");
    balance += amount;
  }

  function withdraw(uint256 amount) public {
    require(amount <= balance, "Amount must not be greater than balance");
    balance -= amount;
  }

}
