//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract C {

// a. Create an integer state variable called data which can only be used internally and not at all in any other contracts.
    uint private data;
    
// b. Create an integer state variable called info which can be called both inside and outside the contract
    uint public info; 

// c. Immediately initialize info's value to 10 within a constructor
    constructor() {
        info = 10;
    }
    
/*
d. Createa a function called increment which can only be used internally and not at all in any other contracts.
It should take an input integer called a and be read only returning the calculation of its input + 1.
*/
    function increment(uint a) pure private returns(uint) {
        return a + 1;
    }
    
/*
e. Write a function called updateData which takes an integer argument called a and sets data to the argument.
The function should be able to be called both inside and outside the contract.
*/
    function updateData(uint a) public {
        data = a;
    }
    
// f. Write a read only function called getData which returns value of the data and can be called both inside and outside the contract
    function getData() view public returns(uint) {
        return data;
    }
    
/* 
g. Write a read only function called compute which calculates and returns two integer arguments a + b.
The function should can only be used internally or by derived contracts.
*/
    function compute(uint a, uint b) pure internal returns(uint) {
        return a + b;
    }
}




contract D {

// a. derive contract C to a new variable c and set a new instance of the contract to it.
    C c = new C();

/* b. write a read only function called readInfo which returns the info from contract c
which can be called both inside and outside the contract.
*/
    function readInfo() view public returns(uint) {
        return c.info();
    }
}




// a. inherit contract C into E with the special keyword is
contract E is C {

// b. create an integer called result which can only be used internally and not even by derived contracts.
    uint private result;
    
// c. create a private variable c which inherits the contract C
    C private c;
    
// d. immediately set the variable c to a new instance of the contract C upon deployment with a constructor    
    constructor() {
        c = new C();
    }
    
/* e. write a function called getComputedResult which sets the values of 23 and 5 to the compute function in contract C to the var result.
The function can be used both externally and internally.
*/
    function getComputedResult() public {
        result = compute(23, 5);
    }
    
// f. create a public read only function called getResult which returns the var result.    
    function getResult() public view returns(uint) {
        return result;
    }
    
/* g. create a read only function called getNewInfo which returns the info variable from contract C and 
set the function to be used both externaly and internally   
*/
    function getNewInfo() view public returns(uint) {
        return c.info();
    }
}
