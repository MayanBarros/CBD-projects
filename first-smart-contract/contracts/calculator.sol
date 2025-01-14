// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Calculator {
    uint public result;
    address public owner;

    event CalculationPerformance(string operation, uint operand1, uint operand2, uint result);

    modifier onlyOwner() {
        require(msg.sender==owner, "Not the contract owner");
        _;
    }

    constructor() {
        owner = msg.sender;
        result = 0;
    }

    function add(uint num1, uint num2) public onlyOwner returns(uint) {
        result = num1 + num2;
        emit CalculationPerformance("addition", num1, num2, result);
        return result;
    }

    function sub(uint num1, uint num2) public onlyOwner returns(uint) {
        require(num1 >= num2, "Result will be negative");
        result = num1 - num2;
        emit CalculationPerformance("subtraction", num1, num2, result);
        return result;
    }

    function multi(uint num1, uint num2) public onlyOwner returns(uint) {
        result = num1 * num2;
        emit CalculationPerformance("multiplication", num1, num2, result);
        return result;
    }

    function div(uint num1, uint num2) public onlyOwner returns(uint) {
        require(num2 > 0, "Division by zero");
        result = num1 / num2;
        emit CalculationPerformance("division", num1, num2, result);
        return result;
    }
}