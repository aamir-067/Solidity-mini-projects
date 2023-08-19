# Solidity-mini-projects

contains `only contracts` (maybe i create frontend in the future)

## `1. Lottery.sol`

1. this contract will takes minimum 2 ether to participate in lottery
2. only manager (who deploy the contract) can see all the prize and select the winner
3. manager can't participate in the lottery
4. minimum of 2 participants are required to declare the winner.

### `Note:`

#### Full dapp is uploaded to the public repository `Lottery Dapp` on my github [click here](https://github.com/aamir-067) to visit

## `2. Ticket.sol`

with this contract a a person will register a show or any function(like wedding, coding workshop etc) so that people can purchase tickets. and also they can sent it to other persons.

### `Note : `

i didn't implement the transfer of the ticket functionality but soon it will be updated in next commits.

## `3. FundRaiser.sol`

The reference of the contract is taken from the youtuber `Code Eater` this contract is about fundraising so the deployer of the will become the manager of the fund and the contributors will send some ethers to the contract address instead of sending them to the manager which will build trust between the manager and the contributors.

### `Some bullet points`

1. manager will set the deadline and the minimumamount and the target amount to be achieved.
2. if the target is not hit before the deadline then the contributors can withdraw their amounts from the contract.
3. If contributor wants to withdraw the amount from the contract then he can do it in 2 conditions `1.` if the target is not hit before the deadline `2.` if the target is achieved and the manager is not withdraw the amount.
4. manager can withdraw the amount after he gets the majority of the votes and the target is achieved already.

### `Notes : `

1. write now the contract is not yet fully written
2. the contract will be completed in next commits soon.
