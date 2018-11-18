var AccountInformation = artifacts.require("./AccountInformation.sol");

module.exports = function(deployer) {
    deployer.deploy(AccountInformation);
}