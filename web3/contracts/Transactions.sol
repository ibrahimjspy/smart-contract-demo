// SPDX-License-Identifier: MIT
//WARN This project is only for task and is and extension of allready created scaffold
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Transactions {
    uint256 Count;

    event Transfer(address from, address receiver, uint amount, string message, uint256 timestamp, string keyword);
  // account schema 
    struct TransferStruct {
        address sender;
        address receiver;
        uint amount;
        string message;
        uint256 timestamp;
        string keyword;
    }

    TransferStruct[] accounts; // storing transaction in an array with object types 

    function addToBlockchain(address payable receiver, uint amount, string memory message, string memory keyword) public {
        Count += 1;
        accounts.push(TransferStruct(msg.sender, receiver, amount, message, block.timestamp, keyword));

        emit Transfer(msg.sender, receiver, amount, message, block.timestamp, keyword);
    }

    function getAllTransactions() public view returns (TransferStruct[] memory) {
        return accounts;
    }

    function getTransactionCount() public view returns (uint256) {
        return Count;
    }
}