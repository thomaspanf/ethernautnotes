# 1. Fallout

To Beat the Level: 

- claim ownership of the contract


notice that the constructor is misspelled as Fal1out() instead of Fallout()

```
  /* constructor */
  function Fal1out() public payable {
    owner = msg.sender;
    allocations[owner] = msg.value;
  }
```

If the constructor does not have the exact same name as the contract, it becomes a publicly invokable function. In this case, Fal1out() allows anybody to call the function and take ownership of the function with any msg.value.

>Solution: 

- contract.Fal1out()

if we call contract.owner(), we can see that our address is now the owner of the contract. 

The main takeaway from this stage is that small human errors such as typos can cause catastrophic damage. 


