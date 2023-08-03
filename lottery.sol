// SPDX-License-Identifier: MIT
pragma solidity >=0.5 <=0.9;

contract myContract {
    struct Costumer {
        string name;
        uint age;
        address payable adr;
    }

    address manager;
    address payable[] costumers;
    Costumer[] Costumers;

    //mapping (uint => Costumer) Costumers;

    constructor() {
        manager = msg.sender;
    }

    function takLottery(string memory _name, uint _age) public payable {
        address payable temp = payable(msg.sender);
        require(temp != manager, "costumer should not be the manager");
        require(
            msg.value >= 2 ether,
            "Insufficient payment. Minimum payment required is 2 ether."
        );
        Costumer memory temp2 = Costumer(_name, _age, payable(msg.sender));
        Costumers.push(temp2);
    }

    function seeCostumer(uint _index) public view returns (Costumer memory) {
        require(
            msg.sender == manager,
            "Only Manager can see the Lottery participants"
        );
        return Costumers[_index];
    }

    function seeLottery() public view returns (uint) {
        require(
            msg.sender == manager,
            "Only Manager can see the Lottery Amount"
        );
        return address(this).balance;
    }

    function Rand() public view returns (uint) {
        uint256 random = uint256(
            keccak256(
                abi.encodePacked(
                    block.timestamp,
                    block.difficulty,
                    Costumers.length
                )
            )
        );
        uint ttt = random;
        return ttt % Costumers.length;
    }

    function SelectWinner() public returns (string memory) {
        require(msg.sender == manager, "only manager can select the winner");
        require(Costumers.length >= 2, "participants must greater then two.");
        uint winIndex = Rand();
        address payable win = payable(Costumers[winIndex].adr);
        win.transfer(seeLottery());
        string memory name = Costumers[winIndex].name;
        return name;
    }

    function SeeManager() public view returns (address) {
        return manager;
    }
}
