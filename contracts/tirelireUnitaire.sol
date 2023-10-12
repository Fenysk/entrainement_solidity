// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract TirelireUnitaire {
    
    mapping(address => uint) Balances;

    function getUserBalance(address _adresse) public view returns(uint) {
        return Balances[_adresse];
    }

    receive() external payable {
        // msg.value
        // msg.sender
        Balances[msg.sender] = msg.value;
    }

}