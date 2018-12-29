pragma solidity ^0.4.10;

contract TemperatureAlert {
    address coldstore;
    address customer;
    int overTemperature;

    function TemperatureAlert() {
        coldstore = 0x3Adb96D017239642e7B87ea816dd6171581F1d3A;
        customer = 0x4aE82F919e03741cE8E69C108ea25438b218d668;
    }

    function setOverTemperature(int _overTemperature) {
        require(msg.sender == coldstore);
        overTemperature = _overTemperature;
    }

    function getOverTemperature() constant returns (int) {
        require(msg.sender == customer);
        return overTemperature;
    }
}
