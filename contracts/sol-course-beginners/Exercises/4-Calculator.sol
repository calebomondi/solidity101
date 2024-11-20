// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

// 1️⃣ Make a contract called Calculator
// 2️⃣ Create Result variable to store result
// 3️⃣ Create functions to add, subtract, and multiply to result
// 4️⃣ Create a function to get result

contract Calculator {
    uint256 public result = 0;

    function add(uint256 _val) public  {
        result += _val;
    }

    function subtract(uint256 _val) public  {
        result -= _val;
    }

    function multiply (uint256 _val) public {
        result *= _val;
    }

    function getResult() public view returns (uint256) {
        return result;
    }

}
