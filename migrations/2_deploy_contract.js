const Fxnal_1 = artifacts.require('Fxnal_1');
const Proxy = artifacts.require('Proxy');

module.exports = async function(deployer, network, accounts){
  //Deploy The Contracts
  const _Fxnal_1 = await Fxnal_1.new();
  const proxy = await Proxy.new(_Fxnal_1.address);

}