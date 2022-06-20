# 3 Coin Flip 

## This is a coin flipping game where you need to build up your winning streak by guessing the outcome of a coin flip. To complete this level you'll need to use your psychic abilities to guess the correct outcome 10 times in a row.

This challenge demonstrates why using known block hashes to generate random numbers can pose a security risk. In the CoinFlip contract, the `flip()` function generates a uint256 blockValue by taking the hash of the previous block. It's the hash of the current block-1 because the has of the current block number is not known until it is mined. 

```
uint256 blockValue = uint256(blockhash(block.number.sub(1))); 
```

`flip()` will use this to randomly pick a side of a coin. An attacker can take advantage of this method of random number generation to 'predict' what side the coin will flip by deploying a contract with a function that mirrors the exact behavior of the `flip()`.

**Solution:**
`HackFlip.sol()` is in this same folder. Deploy to remix and pass the ethernaut level instance address into the constructor, then call HackFlip 10 times. 

calling `await contract.consecutiveWins()` will show the number of consecutive wins. Once this number reaches 10, you can submit the level instance. 

**Takeaway:**
- don't try to generate randomness on chain using blockhash, use an oracle such as chainlink vrf



