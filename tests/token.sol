// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract Token {
    //state variables
    string name;
    uint256 _totalSupply;
    mapping (address => uint256) balances;

    constructor(string memory _newName) {
        name = _newName;
    }

    //mint
    function mint10() external {
        //update the balance of the address
        balances[msg.sender] += 10;
        //update totalSupply
        _totalSupply += 10;
    }
    //burn
    function burn10Token() external {
        balances[msg.sender] -= 10;
        _totalSupply -= 10;
    }
    //transfer
    function transfer10Token(address ) external {
        balances[msg.sender] -=10;
        balances[_receiver] +=10;
    }
    //balanceOf
    function balanceOf() external view returns (uint256) {
        return balances[msg.sender];
    }

    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }
    //
}