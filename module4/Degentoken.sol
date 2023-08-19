
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

    enum Prize {
        None,
        Prize1,
        Prize2,
        Prize3
    }

    mapping(address => Prize) private userPrizes;

    function redeem(Prize selectedPrize) public {
        uint256 prizeCost = 1; // Each prize costs 1 token.

        require(balanceOf(msg.sender) >= prizeCost, "Insufficient balance");
        require(selectedPrize != Prize.None, "Invalid prize selection");

        _burn(msg.sender, prizeCost);

        userPrizes[msg.sender] = selectedPrize;

        emit RedeemedPrize(msg.sender, prizeCost, selectedPrize);
        console.log("Redemption successful. You selected prize:", selectedPrize);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function getRandomPrize() internal view returns (Prize) {
        uint256 randomNumber = uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender)));
        uint8 prizeIndex = uint8(randomNumber % uint8(Prize.Prize3) + 1);
        return Prize(prizeIndex);
    }

    function getUserPrize(address user) public view returns (Prize) {
        return userPrizes[user];
    }

    event RedeemedPrize(address indexed user, uint256 cost, Prize prizeType);
}

