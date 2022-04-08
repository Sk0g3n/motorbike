const MotorBikeFactory = artifacts.require('MotorbikeFactory');

module.exports = async (deployer, network, accounts) => {
    const motorbikefactory = await MotorBikeFactory.new();
    MotorBikeFactory.setAsDeployed(motorbikefactory);
}