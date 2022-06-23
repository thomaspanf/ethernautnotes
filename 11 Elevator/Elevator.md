# 11 Elevator 

This elevator won't let you reach the top of your building. Right?

Things that might help:
>Sometimes solidity is not good at keeping promises.
>This Elevator expects to be used from a Building.

---

Review on function state modifiers: 
- `pure`: promises functions that will neither read from nor modify the state. 
- `view`: promises that functions will only read, but not modify the state.
- `default`[no modifier] promises functions that will read and modify the state.

---

In the Elevator.sol file, the building interface is not implemented. The line of code that is of interest is this: 
```
Building building = Building(msg.sender);
```
`msg.sender` is passed into the constructor, which means that building variables could point to `msg.sender's` contract. 

The goal of this stage is to change the state variable `bool public top` to true. In order to do this, we need `building.isLastFloor` to return `false`, then `true` in the same call.  
```
if (! building.isLastFloor(_floor)) {
    ///irrelevant loc
    top = building.isLastFloor(floor);
}
 ```
 The solution uses the above logic to invoke `goTo()` and call our own version of `isLastFloor()` which satisfies these conditions. 
 
Deploy the attacker contract and call the `attack()` function. 
We can use this in ethernaut to check if we've passed: 
```
res = await contract.floor()
res.toString()
```

**Takeaways:**
- Be careful using interfaces, allowing unknown contracts to interact with your contract is unsafe. 
- Be mindful of function state modifiers, if the `isLastFloor` function had a `pure` modifier, we wouldn't have been able to read or write the state of `bool public top`