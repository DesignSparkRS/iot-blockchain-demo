pragma solidity ^0.4.10;

contract LeakKiller {
    address owner;
    address insurer;
    int lastLeak;

    function LeakKiller() {
        owner = 0x478f2c61e4eB1c09596a7af138b94AE598dE32c0;
        insurer = 0x4aE82F919e03741cE8E69C108ea25438b218d668;
    }

    function setLastLeak(int _lastLeak) {
        require(msg.sender == owner);
        lastLeak = _lastLeak;
    }

    function getLastLeak() constant returns (int) {
        require(msg.sender == insurer);
        return lastLeak;
    }
}
