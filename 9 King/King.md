# 9 King

The contract below represents a very simple game: whoever sends it an amount of ether that is larger than the current prize becomes the new king. On such an event, the overthrown king gets paid the new prize, making a bit of ether in the process! As ponzi as it gets xD

Such a fun game. Your goal is to break it.

When you submit the instance back to the level, the level is going to reclaim kingship. You will beat the level if you can avoid such a self proclamation.

---
The current price is initialized at 1 eth, so we need to send at least 1 eth to take kingship. This fallback function describes how the game works. 

```
  receive() external payable {
    require(msg.value >= prize || msg.sender == owner);
    king.transfer(msg.value);
    king = msg.sender;
    prize = msg.value;
  }
```
The goal here is to take kingship by sending 1 eth, and then cause the function to revert when the level instance tries to reclaim kingship. 

When we submit the level instance, the level will try to submit a higher prize than ours. When it passes the require statement, `king.transfer(msg.value);` will fail because our attacking contract will cause a revert because it has no way to recieve ethers. 

**Takeaways:**
- this contract is unable to handle transfer errors
- don't trust external parties or untested code/inputs
- using send/transfer is useful to prevent reentrancy since its capped at 2300 gas limit. This isn't best practice because opcodes/gas costs will increase over time. Don't rely on gas limit to protect against reentrancy, use checks and effects pattern. 
