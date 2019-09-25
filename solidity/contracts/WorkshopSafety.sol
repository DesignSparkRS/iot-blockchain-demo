pragma solidity ^0.4.10;

contract WorkshopSafety {
    address machine;
    address healthsafety;
    int lastIncident;

    function WorkshopSafety() {
        machine = 0x32C1E59055fDc0a2D8CEbff5C47b1dA37104B277;
        healthsafety = 0x4aE82F919e03741cE8E69C108ea25438b218d668;
    }

    function setLastIncident(int _lastIncident) {
        require(msg.sender == machine);
        lastIncident =  _lastIncident;
    }

    function getLastIncident() constant returns (int) {
        require(msg.sender == healthsafety);
        return lastIncident;
    }
}
