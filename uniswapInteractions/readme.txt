Exercise Interfaces with Uniswap (Decentralized Exchange)

In Uniswap each Uniswap smart contract, or pair, manages a liquidity pool made up of reserves of two ERC-20 tokens!
In this exercise you are going to use the IDE to speak to Uniswap and get the reserves of a Uniswap pair of your choosing

These are the instructions in order to complete this exercise:
1. Create two interfaces which each hold separate function signatures which you must look up in the Solidity docs V2
2. One interface will be called UniswapV2Factory which will contain the function signature that gets pairs.
3. Another interface will be called UniswapV2Pair with will contain the function signature to get reserve values.
4. Create a contract which contains addresses of the paired tokens you choose as well as the factory address.
5. Within the contract make a function which can successfully get the pair of your tokens and set it to a single address
6. Use that address to get the reserve values and finally return the reserve values
7. Switch to Mainnet and connect MetaMask but DO NOT deploy the contract (or you will spend money!!!)
8. From the Mainnet manually go through the steps of retrieving the values without deploying or spending gas!
