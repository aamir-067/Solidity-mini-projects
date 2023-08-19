//SPDX-License-Identifier : MIT
pragma solidity ^0.8.10;
contract FundRaiser{
    mapping(address => uint) public contributers;
    address public immutable manager;
    uint public immutable minAmount;
    uint public immutable target;             // i make this all public so that i don't have to create a funtions for them explicitly.
    uint public immutable deadline;
    uint public totalContributers;

    constructor(uint _minAmount, uint _target, uint _deadline){
        manager = msg.sender;
        minAmount = _minAmount;
        target = _target;
        deadline = block.timestamp +  _deadline;
    }

    // these functions are for in case someone send amount to the contract without the dapp so then 
    // he will also counted in the contribution.
    recieve()external payable {
        sendFund();
    }
    fallback()external payable {
        sendFund();
    }

    function sendFund() public payable{
        require(msg.value >= minAmount, "You should send a greater amount");
        require(block.timestamp < deadline, "The deadline is reached");
        if (contributors[msg.sender] == 0){
            totalContributers +=1;
        }
        contributors[msg.sender] += msg.value;
    }


    function getBackFund() public { // for participants/contributors

    }

    function withdrawAmount(uint _amount) public {  // for manager

    }

}