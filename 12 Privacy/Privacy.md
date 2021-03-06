# 12 Privacy

The creator of this contract was careful enough to protect the sensitive areas of its storage.

Unlock this contract to beat the level.

Things that might help:

>Understanding how storage works
>Understanding how parameter parsing works
>Understanding how casting works

---

Immediately you can tell that this level draws similarities from level 8: Vault. Completing this challenge involves calling `function unlock(bytes16 _key) public` and passing in the key in order to unlock the contract. To do so, we must understand how storage works in ethereum contracts. Variables are stored into 256 bit slots which can be retrieved using `web3.eth.getStorageAt({contract_address}, {int: slot})` Keep in mind that variables smaller than 256 bits will be packed into the same slot if declared one after the other. 

This is how the storage structure of `Privacy.sol` looks:

```
  bool public locked = true;
  uint256 public ID = block.timestamp;
  uint8 private flattening = 10;
  uint8 private denomination = 255;
  uint16 private awkwardness = uint16(now);
  bytes32[3] private data;
```

For this particular contract, calling `await web3.eth.getStorageAt(contract.address, SLOT_NUM)` from 0 all the way up til 6 will result in this: 

 ```
 0: '0x0000000000000000000000000000000000000000000000000000000000000001' bool locked = true
 1: '0x0000000000000000000000000000000000000000000000000000000062bbc2df' block.timestamp = 1656472287
 2: '0x00000000000000000000000000000000000000000000000000000000c2dfff0a' now = 0xc2df, 255 = ff, 10 = 0a 
 3: '0xa237290aa7375af925587b0938068484a9a9be5709a80f2eadbf9a9bb664e5f6' data[0]
 4: '0x4fb69b8ead8f2068f60efa668b83f6c113f63ad388b16a6577360454e9ab4cb0' data[1]
 5: '0xd228c07337dc72d8c022f662b9bc40b00fde2bb86f9c83559806e9ba81de5d9f' data[2]
 6: '0x0000000000000000000000000000000000000000000000000000000000000000' (0)

```
We're looking for the key stored in: `data[2]`

```
require(_key == bytes16(data[2]));
```
Sice the unlock function requires data[2] to be casted to bytes16, we can just take the first half of the string and pass it into the unlock function to beat the stage. 
```
await contract.unlock('0xd228c07337dc72d8c022f662b9bc40b0')
```

**Takeaways:** 
- Use memory to save on storage if you don't need state to persist
- Everything on ethereum is public
- If you need to store sensitive data, hash it before putting it on chain

[Further Reading](https://medium.com/@dariusdev/how-to-read-ethereum-contract-storage-44252c8af925)

