// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract main {
    struct Event_details {
        string eventName;
        uint eventDate;
        uint totalTickets;
        uint ticketPrice;
        address owner;
    }
    // Event_details[] public allEvents;
    mapping(string => Event_details) public allEvents;

    mapping(address => mapping(string => uint)) public ticketDetails;

    constructor() {}

    function createEvent(
        string memory eventName,
        uint eventDate,
        uint totalTickets,
        uint ticketPrice
    ) public {
        address eventOwner = msg.sender;
        Event_details memory newEvent = Event_details(
            eventName,
            eventDate,
            totalTickets,
            ticketPrice,
            eventOwner
        );
        // allEvents.push(newEvent);
        allEvents[eventName] = newEvent;
    }

    function purchaseTicket(
        string memory eventName,
        uint totalTickets
    ) public payable {
        require(
            allEvents[eventName].eventDate != 0,
            "This show does not exist"
        );
        Event_details storage tempEvent = allEvents[eventName];
        require(
            totalTickets > 0,
            "You must have to purchase atleast one ticket"
        );
        require(
            block.timestamp < tempEvent.eventDate,
            "Event is ended or started"
        );

        require(
            (tempEvent.ticketPrice * totalTickets) <= msg.value,
            "the given ticket price is highier then you paid"
        );
        require(
            tempEvent.totalTickets >= totalTickets,
            "tickets are out of range remaining tickets are "
        );
        tempEvent.totalTickets -= totalTickets;
        ticketDetails[msg.sender][eventName] += totalTickets;
    }
}
