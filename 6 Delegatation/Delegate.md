# 6 Delegation


Taken from the solidity documentation: 
>There exists a special variant of a message call, named delegatecall which is identical to a message call apart from the fact that the code at the target address is executed in the context of the calling contract and msg.sender and msg.value do not change their values.

>This means that a contract can dynamically load code from a different address at runtime. Storage, current address and balance still refer to the calling contract, only the code is taken from the called address.

>This makes it possible to implement the “library” feature in Solidity: Reusable library code that can be applied to a contract’s storage, e.g. in order to implement a complex data structure.


If we type in contract.abi, you can see that there is a fallback function, which tells us that we are only interacting with the Delegation contract. the delegatecall() function in the fallback allows the calling contract (delegation) to invoke a function in the called (delegate) contract. The called contract can influence the state of the calling contract. 

We want to pass in the pwn() function into the delegatecall: 

```  
function pwn() public {
    owner = msg.sender;
  }
}
```
the delegatecall() allows us to pass in a function from the called contract and modifies the storage and state variables of the calling contract. In this case, we want to change the state of owner to msg.sender. 

>Solution: 

```
var pwnFunction = web3.utils.sha3("pwn()")

contract.sendTransaction({data: pwnFunction})
```

First we create a variable that calls the web3 sha3 function to create a sha3 signature that represents the pwn() function we want to call, then we pass that signature in as a transaction into the Delegation contract. Once that transation goes through, msg.sender becomes the owner of the contract. 