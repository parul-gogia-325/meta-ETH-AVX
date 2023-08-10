// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "hardhat/console.sol";

contract DegenGamingToken is ERC20, Ownable {

    constructor(uint256 initialSupply) ERC20("DegenGamingToken", "DGG") {
        _mint(msg.sender, initialSupply);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool success) {
        return super.transfer(to, amount);
    }

    // Modified redeem function
    function redeem(uint256 amount) public {
        require(amount > 0, "Amount must be greater than 0");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");

        // Replace the following line with the logic for prize selection and cost deduction
        // For example, you can emit an event to indicate successful redemption and deduct the cost from the user's balance.
        // For simplicity, let's assume the cost is 1 token per prize.
        uint256 prizeCost = amount; // In this example, each prize costs 1 token.

        // Add your prize selection logic here
        
        // Deduct the cost from the user's balance
        _burn(msg.sender, prizeCost);

        // Emit an event to indicate successful redemption
        emit RedeemedPrize(msg.sender, prizeCost);

        // Add additional actions here, such as transferring the prize or providing other rewards
    }

    // Rest of the functions

    event RedeemedPrize(address indexed user, uint256 cost);
}
