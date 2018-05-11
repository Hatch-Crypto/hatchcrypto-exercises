var Migrations = artifacts.require("./Migrations.sol");
var MathOperationsLib = artifacts.require("./MathOperationsLib.sol");
var UseForType = artifacts.require("./UseForType.sol");
var UseLikeModule = artifacts.require("./UseLikeModule.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(MathOperationsLib);
  deployer.link(MathOperationsLib, UseForType);
  deployer.link(MathOperationsLib, UseLikeModule);
  deployer.deploy(UseForType);
  deployer.deploy(UseLikeModule);
};
