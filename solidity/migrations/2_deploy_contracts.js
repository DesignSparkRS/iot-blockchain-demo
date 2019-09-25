var CarCrash = artifacts.require("./CarCrash.sol");
var MachineFailure = artifacts.require("./MachineFailure.sol");
var TemperatureAlert = artifacts.require("./TemperatureAlert.sol");
var LeakKiller = artifacts.require("./LeakKiller.sol");
var WorkshopSafety = artifacts.require("./WorkshopSafety.sol");

module.exports = function(deployer) {
  deployer.deploy(CarCrash)
    .then(() => console.log(CarCrash.address));
  deployer.deploy(MachineFailure)
    .then(() => console.log(MachineFailure.address));
  deployer.deploy(TemperatureAlert)
    .then(() => console.log(TemperatureAlert.address));
  deployer.deploy(LeakKiller)
    .then(() => console.log(LeakKiller.address));
  deployer.deploy(WorkshopSafety)
    .then(() => console.log(WorkshopSafety.address));
};
