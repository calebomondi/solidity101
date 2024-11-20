// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;    

contract  Twitter{ 
    address public owner;

    //constructor
    constructor(){
        owner = msg.sender;
    }

    //define constant
    uint16 public MAX_TWEET_LENGTH = 280;

    //tweet struct
    struct Tweet {
        uint256 id;
        address author;
        string content;
        uint256 createdAt;
        uint256 likes;
    }

    //events
    event TweetCreated(uint256 id, address indexed  author, string content, uint256 timestamp);
    event TweetLiked(address liker, address indexed  tweetAuthor, uint256 tweetId, uint256 newLikeCount);
    event TweetUnliked(address liker, address indexed  tweetAuthor, uint256 tweetId, uint256 newLikeCount);

    //mapping user to message
    mapping (address => Tweet[]) public   tweets;

    modifier  onlyOwner() {
        require(msg.sender == owner, "You Are Not The Owner!");
        _;
    }

    function changeTweetLength (uint16 newLength) public onlyOwner {
        MAX_TWEET_LENGTH = newLength;
    }

    function likeTweet(address author, uint256 id) external  {
        require(tweets[author][id].id == id, "TWEET DOES NOT EXIST");
        tweets[author][id].likes++;
        emit TweetLiked(msg.sender, author, id, tweets[author][id].likes);
    }

    function unlikeTweet(address author, uint256 id) external  {
        require(tweets[author][id].id == id,"TWEET DOES NOT EXIST!");
        require(tweets[author][id].likes > 0,"TWEET HAS NO LIKES");
        tweets[author][id].likes--;
        emit TweetUnliked(msg.sender, author, id, tweets[author][id].likes);
    }

    function createTweet(string memory _tweet )public {
        require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "Invalid tweet length");

        Tweet  memory newTweet = Tweet(
            {
                id: tweets[msg.sender].length,
                author: msg.sender, 
                content: _tweet,
                createdAt: block.timestamp, 
                likes :0
            }
        );
        tweets[msg.sender] .push(newTweet);
        emit TweetCreated(newTweet.id, newTweet.author, newTweet.content, newTweet.createdAt);
    }

    function getTweet(uint _i) public view returns (Tweet memory){
        return tweets[msg.sender][_i];
    }

    function getAllTweets(address _owner) public view returns  (Tweet[] memory) {
        return  tweets[_owner];
    }
}

