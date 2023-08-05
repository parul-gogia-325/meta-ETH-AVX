// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Token {

    // public variables here
    string public tokenName = "MINTERS";
    string public abbrv = "MTR";
    uint public totalSupply = 0;
    address public owner; // Contract owner's address

    // mapping variable here
    mapping (address => uint) public balances;

    // modifier to restrict functions to the contract owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }

    // constructor to set the contract owner
    constructor() {
        owner = msg.sender;
    }

    // mint function - Only the contract owner can call this
    function mint(address _address, uint _value) public onlyOwner {
        totalSupply += _value;
        balances[_address] += _value;
    }

    // burn function
    function burn(address _address, uint _value) public {
        if (balances[_address] >= _value) {
            totalSupply -= _value;
            balances[_address] -= _value;
        }
    }

    // transfer tokens from one address to another
    function transfer(address _to, uint _value) public {
        require(_value <= balances[msg.sender], "Insufficient balance");
        balances[msg.sender] -= _value;
        balances[_to] += _value;
    }
}
