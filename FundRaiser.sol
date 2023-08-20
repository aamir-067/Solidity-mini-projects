//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract FundRaiser {
    mapping(address => uint) public contributers;
    address public immutable manager;
    uint public immutable minAmount;
    uint public immutable target; // i make this all public so that i don't have to create a funtions for them explicitly.
    uint public immutable deadline;
    uint public totalContributers;

    constructor(uint _minAmount, uint _target, uint _deadline) {
        manager = msg.sender;
        minAmount = _minAmount;
        target = _target;
        deadline = block.timestamp + _deadline;
    }

    // these functions are for in case someone send amount to the contract without the dapp so then
    // he will also counted in the contribution.
    receive() external payable {
        sendFund();
    }

    fallback() external payable {
        sendFund();
    }

    function sendFund() public payable {
        require(msg.value >= minAmount, "You should send a greater amount");
        require(block.timestamp < deadline, "The deadline is reached");
        if (contributers[msg.sender] == 0) {
            totalContributers += 1;
        }
        contributers[msg.sender] += msg.value;
    }

    function refund() public payable {
        // for participants/contributors

        require(
            block.timestamp > deadline && target < address(this).balance,
            "You can't withdraw funds right now"
        );
        require(contributers[msg.sender] >= 100, "You are not the contributer");
        payable(msg.sender).transfer(contributers[msg.sender]);
    }

    function withdrawAmount(uint _amount) public {
        // for manager
    }
}
