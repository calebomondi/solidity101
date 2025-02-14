// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

// 1️⃣ Create a Twitter Contract 
// 2️⃣ Create a mapping between user and tweet 
// 3️⃣ Add function to create a tweet and save it in mapping
// 4️⃣ Create a function to get Tweet 
// 5️⃣ Add array of tweets 

contract Twitter {
    mapping  (address => string[]) public tweets;

    function createTweet(string memory tweet) public {
        tweets[msg.sender].push(tweet);
    }

    function getTweet (uint _i) public view returns (string memory)  {
        return tweets[msg.sender][_i];
    }

    function getAllTweets() public view returns (string[] memory) {
        return  tweets[msg.sender];
    }
}