pragma solidity ^0.4.10;

contract CarCrash {
    address owner;
    address insurer;
    int impact;

    function CarCrash() {
        owner = 0x2BC19750cdf3991D0A27d45304276Cd4D71F6975;
        insurer = 0x4aE82F919e03741cE8E69C108ea25438b218d668;
    }

    function setImpact(int _impact) {
        require(msg.sender == owner);
        impact = _impact;
    }

    function getImpact() constant returns (int) {
        require(msg.sender == insurer);
        return impact;
    }
}
