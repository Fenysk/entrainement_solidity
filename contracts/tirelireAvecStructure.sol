// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract TirelireAvecStructure {
    struct balance {
        uint256 money;
        uint256 paymentsCount;
    }

    mapping(address => balance) Balances;

    function getUserBalance() public view returns (uint256) {
        return Balances[msg.sender].money;
    }

    function getUserPaymentsCount() public view returns (uint256) {
        return Balances[msg.sender].paymentsCount;
    }

    function getTotalBalance() public view returns (uint256) {
        return address(this).balance;
    }

    receive() external payable {
        Balances[msg.sender].money += msg.value;
        Balances[msg.sender].paymentsCount++;
    }
}
