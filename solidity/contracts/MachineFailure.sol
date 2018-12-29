pragma solidity ^0.4.10;

contract MachineFailure {
    address owner;
    address maintainer;
    int lastFailure;

    function MachineFailure() {
        owner = 0x7B0975783Ee29B5416AcaC1d47b29908a06322Fe;
        maintainer = 0x4aE82F919e03741cE8E69C108ea25438b218d668;
    }

    function setLastFailure(int _lastFailure) {
        require(msg.sender == owner);
        lastFailure = _lastFailure;
    }

    function getLastFailure() constant returns (int) {
        require(msg.sender == maintainer);
        return lastFailure;
    }
}
