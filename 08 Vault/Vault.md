# 7 Vault

It's important to remember that marking a variable as private only prevents other contracts from accessing it. State variables marked as private and local variables are still publicly accessible.

To ensure that data is private, it needs to be encrypted before being put onto the blockchain. In this scenario, the decryption key should never be sent on-chain, as it will then be visible to anyone who looks for it. zk-SNARKs provide a way to determine whether someone possesses a secret parameter, without ever having to reveal the parameter.

**Solution:**
Storage in smart contracts are stored in 32 byte slots. In the `Vault.sol` contract, we can see that the password is stored in slot 2 (index 1) 

conveniently there is a function in the web3 library that lets us grab storage contents by slots:

>web3.eth.getStorageAt("instance address", 1)

alternatively there is an ethers.js equivalent:

>await provider.getStorageAt(address, slot);

once we have the password, we can call the `unlock()` function, passing in our `bytes32 _password` as a parameter.

**Takeaway:**
everything on ethereum is public 

