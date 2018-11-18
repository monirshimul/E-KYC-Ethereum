var Kyc = artifacts.require("./KYC.sol");

module.exports = function(deployer) {
  deployer.deploy(Kyc, { gas : 50000000});
};