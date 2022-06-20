# 3 Telephone

## This state demonstrates the difference between tx.origin and msg.sender

tx.origin (address payable) = sender of the transation in the full call chain

msg.sender (address payable) =  ender of the message in the current call


In a situation where a user calls a function in contract 1, that calls a contract in function 2, 

```
            at execution contract 1     at execution in contract 2
msg.sender      userAddress                  contract1Address
tx.origin       userAddress                  userAddress
```

**Solution**
deploy an attacking contract and pass in the `contract.address' into the constructor, then call the changeOwner() function in contract 1 from contract 2 with your address as an argument
```-
    function takeOwnership(address _owner) public {
        phone.changeOwner(_owner); 
    }
```
**Takeaway**
you probably don't wanna use tx.origin
[Further Reading](https://hackernoon.com/hacking-solidity-contracts-using-txorigin-for-authorization-are-vulnerable-to-phishing?ref=hack    