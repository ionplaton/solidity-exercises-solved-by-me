//SPDX-License-Identifier: MIT
pragma solidity ^0.8;

/*
1. You must create a contract called auction which contains state variables to keep track of the beneficiary (auctioneer), 
the highest bidder, the auction end time and the highest bid.
*/
contract auction {
    address payable public beneficiary;
    address public highestBidder;
    uint public auctionEndTime;
    uint public highestBid;
    bool ended;

    mapping(address => uint) pendingReturns;

/*
2. There must be events set up which can emit whenever the highest bid changes both address and amount and an event for 
the auction ending emitting the winner address and amount.
*/
    event highestBidIncreased(address bidder, uint amount);
    event auctionEnded(address winner, uint amount);

// 3. The contract must be deployed set to the beneficiary address and how long the auction will run for.
    constructor(uint _biddingTime, address payable _beneficiary) {
        beneficiary = _beneficiary;
        auctionEndTime = block.timestamp + _biddingTime;
    }

/*
4. There should be a bid function which includes the following:
   a. revert the call if the bidding period is over.
   b. if the bid is not higher, send the money.
   c. emit the highest bid has increased
*/
    function bid() public payable {
        if(block.timestamp > auctionEndTime) {
            revert('The auction has ended');
        }
        if(msg.value <= highestBid) {
            revert('Sorry, theid is not high enough!');
        }
        if(highestBid != 0) {
            pendingReturns[highestBidder] += highestBid;
        }
        highestBidder = msg.sender;
        highestBid = msg.value;
        emit highestBidIncreased(msg.sender, msg.value);
        
    }

// 5. Bearing in mind the withdrawal pattern, there should be a withdrawal function to return bids based on the library of keys and values.
    function withdraw() public payable returns(bool) {
        uint amount = pendingReturns[msg.sender];
        if(amount > 0) {
            pendingReturns[msg.sender] = 0;
        }
        if(!payable(msg.sender).send(amount)) {
            pendingReturns[msg.sender] = amount;
        }
        return true;
    }

// 6. There should be a function which ends the auction and sends the highest bid to the beneficiary.
    function auctionEnd() public {
        if(block.timestamp < auctionEndTime) {
            revert('The auction has not ended yet!');
        }
        if(ended) {
            revert('The auction is already over!');
        }

        ended = true;
        emit auctionEnded(highestBidder, highestBid);
        beneficiary.transfer(highestBid);
    }

}
