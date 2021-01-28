const Fxnal_1 = artifacts.require('Fxnal_1');
const Proxy = artifacts.require('Proxy');
const Fxnal_2 = artifacts.require("Fxnal_2");

module.exports = async function(deployer, network, accounts){
    //Deploy The Contracts
    const _fxnal_1 = await Fxnal_1.new();
    const proxy = await Proxy.new(_fxnal_1.address);

    //Access Fxnal_1 through Proxy
    var proxyFxnal= await Fxnal_1.at(proxy.address);

    //Set the no of Clans through Proxy
    await proxyFxnal.setNoOfClans(7);

    //Test
    var noOfClans = await proxyFxnal.getNoOfClans();
    console.log("Before upgrading" + noOfClans.toNumber());

    //deploy Fxnal_2 and upgrade fxnal contract address in Proxy
    const fxnal_2 = await Fxnal_2.new();
    proxy.upgrade(fxnal_2.address);

    //Access Fxnal_2 through proxy
    proxyFxnal = await Fxnal_2.at(proxy.address);

    //Initialize the proxy state
    proxyFxnal.initialize(accounts[0]);

    //Test if the storage is retained from previous 
    noOfClans = await proxyFxnal.getNoOfClans();
    console.log("After upgarding" + noOfClans.toNumber());

    //Set the number of Clans in New Fxnal Contract [Fxnal_2] 
    await proxyFxnal.setNoOfClans(9);

    //Test if the new fxn worked in Fxnal_2 contract
    noOfClans = await proxyFxnal.getNoOfClans();
    console.log("After second upgrade" + noOfClans.toNumber());
}