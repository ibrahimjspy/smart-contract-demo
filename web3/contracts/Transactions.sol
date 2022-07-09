// SPDX-License-Identifier: MIT
//WARN This project is only for task and is and extension of allready created scaffold
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Transactions {
    //Number of tokens and addresses
    uint256 Count;

    event Transfer(address from, address receiver, uint amount, string message, uint256 timestamp, string keyword);
  // account schema 
    struct AccountStruct {
      address token_address;
      uint token_amount;
    }
    // transaction address 
    struct TransferStruct {
        address sender;
        address receiver;
        uint amount;
        string message;
        uint256 timestamp;
        string keyword;
    }
    // transactions list 
    TransferStruct[] transactions; // storing transaction in an array with object types 
    // accounts list 
    AccountStruct[] accounts;
    // for now no mock data for accounts only for transactions which are very similar 
    //Watn only for task representation 
    function getAllAccounts() public view returns (uint256) {
        return accounts;
    }
    // transaction functions 
    function addToBlockchain(address payable receiver, uint amount, string memory message, string memory keyword) public {
        Count += 1;
        transactions.push(TransferStruct(msg.sender, receiver, amount, message, block.timestamp, keyword));

        emit Transfer(msg.sender, receiver, amount, message, block.timestamp, keyword);
    }

    function getAllTransactions() public view returns (TransferStruct[] memory) {
        return transactions;
    }
    // this function can be used to get accounts count as well 
    function getTransactionCount() public view returns (uint256) {
        return Count;
    }
}