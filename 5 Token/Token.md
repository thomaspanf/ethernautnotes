Before the current version 0.8.x solidity (as of writing this), solidity did not have any checks preventing overflow and underflow. The default size for an unsigned integer is 256 bits. 

ex. 
uint8 max = 256;
max++; 
//max == 0

this is the reason why OpenZeppelin has the SafeMath.sol contract standard to prevent over/underflows by adding standard function modifiers to lock the size of a uint. 

However, this isn't as relevant since the latest version of solidity takes care of it for us. 

>Solution
call the transfer() function and pass in any address and 21 tokens as parameters (or anything more than 20). This causes an underflow, which sets the msg.sender's balance to 255. 
