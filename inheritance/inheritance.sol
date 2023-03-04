//SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract A {

// Contract A should have a state variable called innerVal initialized to 100.
    uint innerVal = 100;

// Create a fully accessible function called innerAddTen which returns 10 to any given input.
    function innerAddTen(uint val) public pure returns(uint) {
        return val + 10;
    }
}

// Contract B should inherit from contract A.
contract B is A {

// Contract B should have a function called outerAddTen which returns the calculation from innerAddTen function in Contract A to any given input.
    function outerAddTen(uint val) public pure returns(uint) {
       return A.innerAddTen(val);
    }

// Create a function in contract B which returns the value of innerVal from contract A
    function getInnerVal(uint) public view returns(uint) {
        return A.innerVal;
    }
}
