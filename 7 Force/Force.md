# 7 Force

Some contracts will simply not take your money ¯\_(ツ)_/¯

( yes i know i dropped my \ )

The goal of this level is to make the balance of the contract greater than zero.

  Things that might help:

>Fallback methods
>Sometimes the best way to attack a contract is with another contract.
>See the Help page above, section "Beyond the console"


The key to this problem is the `selfdestruct` opcode. Essentially it's used to abandon a contract and forward the remaining ether to another contract. The `Force.sol` contract in the puzzle does not have a `payable` function that allows the contract to recieve ether, so we may use `selfdestruct` in another contract in order to forward the remaining ether to `Force.sol`

**Solution:**

We need to deploy a contract that has a payable function which allows for the contract to recieve ether. Once we send ether to this contract, call the `selfdestruct()` and pass in the instance address as the parameter. 


    function destruct(address payable _to) external payable {
        selfdestruct(_to);
    }

    function deposit() external payable {
        balance += msg.value;
    }

**Takeaways** 
Don't make the assumption that you are in charge of the balance sheet of your contract. `selfdestruct` is still accessable via `delegatecall` even if you don't implement `selfdestruct` in your own contract. Emit an event when you `selfdestruct` for reference