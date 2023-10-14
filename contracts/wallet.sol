// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Wallet {
    struct wallet {
        uint256 balance;
        uint256 paymentsCount;
    }

    mapping(address => wallet) Wallets;

    function getTotalBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function getUserBalance() public view returns (uint256) {
        return Wallets[msg.sender].balance;
    }

    function withdrawAllMoney(address payable _to) public {
        uint amount = Wallets[msg.sender].balance;
        Wallets[msg.sender].balance = 0;
        _to.transfer(amount);
    }

    receive() external payable {
        Wallets[msg.sender].balance += msg.value;
        Wallets[msg.sender].balance += 1;
    }
}