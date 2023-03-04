//SPDX-License-Identifier: MIT
pragma solidity ^0.8;

/*
1. Create two interfaces which each hold separate function signatures which you must look up in the Solidity docs V2
2. One interface will be called UniswapV2Factory which will contain the function signature that gets pairs.
To find this function we will go to the Uniswap Docs V2 and search the keyword 'getPair".

*/
interface UniswapV2Factory {
        function getPair(address tokenA, address tokenB) external view returns (address pair);
    }
/*
3. Another interface will be called UniswapV2Pair with will contain the function signature to get reserve values.
To find this function we will go to the Uniswap Docs V2 and search the keyword 'getReserves".
*/
interface UniswapV2Pair {
        function getReserves() external view returns (uint reserveA, uint reserveB);
    }

/*
4. Create a contract which contains addresses of the paired tokens you choose as well as the factory address.
To find the factory address we will go to the Uniswap Docs V2 and search the keyword 'UniswapV2Factory is deployed at".
To find the addresses of two tokens we can go on etherscan.io and copy the contract addresses of them. I choosen DAI and Wraped Ethereum.
*/
contract UniswapInteraction {

    address private dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;

    function getReserveTokens() external view returns(uint, uint) {
    
// 5. Within the contract make a function which can successfully get the pair of your tokens and set it to a single address
        address pair = UniswapV2Factory(factory).getPair(dai, weth);
        
// 6. Use that address to get the reserve values and finally return the reserve values
        (uint reserveA, uint reserveB) = UniswapV2Pair(pair).getReserves();
        return(reserveA, reserveB);
    } 
}

/* 
in Remix (remix.ethereum.org):
7. Switch to Mainnet and connect MetaMask but DO NOT deploy the contract (or you will spend money!!!)
8. From the Mainnet manually go through the steps of retrieving the values without deploying or spending gas!
*/
