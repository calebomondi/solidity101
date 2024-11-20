// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;   

contract ArrayExample {
    //dynamic
    uint[] public numbers = [1, 2, 3];
    string[] public names = ['bob', 'alice'];
    //fixed
    uint[5] public myArray;

    function get(uint index) public view returns(uint) {
        return numbers[index];
    }
    function set(string memory value) public  {
        names.push(value);
    }
}