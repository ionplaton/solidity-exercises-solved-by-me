Create an Auction DApplication (The Decentralized Ebay)

Your mission is to write a decentralized auction DApplication which can at the minimum have the following functionality:

1. You must create a contract called auction which contains state variables to keep track of the beneficiary (auctioneer), the highest bidder, the auction end time 
   and the highest bid.
2. There must be events set up which can emit whenever the highest bid changes both address and amount and an event for the auction ending emitting the winner 
   address and amount.
3. The contract must be deployed set to the beneficiary address and how long the auction will run for.
4. There should be a bid function which includes the following:
   a. revert the call if the bidding period is over.
   b. if the bid is not higher, send the money.
   c. emit the highest bid has increased
5. Bearing in mind the withdrawal pattern, there should be a withdrawal function to return bids based on the library of keys and values.
6. There should be a function which ends the auction and sends the highest bid to the beneficiary.
