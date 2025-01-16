// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.26;

contract Hello {
    string public hello;

    constructor(string memory name) {
        hello = name;
    }

    function sayHello() public view returns (string memory) {
         return string.concat("Hello there ", hello, ", Welocme to Human :)");
    }
}