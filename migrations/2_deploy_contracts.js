const Migrations = artifacts.require("Migrations");
const Shippingtracking = artifacts.require("Shippingtracking");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(Shippingtracking);
};
