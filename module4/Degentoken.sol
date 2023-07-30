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

    function redeem(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function getBalance(address account) public view returns (uint256 balance) {
        return balanceOf(account);
    }
}
