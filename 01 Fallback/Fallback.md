
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
```

the contribute function checks if the contribution is less than 0.001 ether and if it's true, the msg.sender takes ownership of the contract.

```
toWei("0.001") => returns 1000000000000000
```

returns the value of ether to wei, so any contribution less than '1000000000000000' will meet the conditions to increment the contributions of `msg.sender`

**order of calls to solve this stage**

```
contract.contribute.sendTransaction({value: 10000000000000})
contract.sendTransaction({value: 10000000000000})
```
Sending a transaction without calling a function will trigger the fallback function, giving ownership of the contract to `msg.sender`. Once `msg.sender` takes ownership, `contract.withdraw` is open to be called. 


  
 


- If you implement a fallback function, keep it simple

  

- Use fallback functions to emit payment events to the transaction log

  

- Use fallback functions to check simple conditional requirements

  

- Think twice before using fallback functions to change contract ownership, transfer funds, support low-level function calls, and more.