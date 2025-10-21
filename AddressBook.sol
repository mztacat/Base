// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.20;

pragma solidity >=0.8.12;
import "https://github.com/OpenZeppelin/openzeppelin-solidity/blob/master/contracts/access/Ownable2Step.sol";
contract AddressBook is Ownable(msg.sender) {
    // Define a private salt value for internal use
    string private salt = "value"; 

    // Define a struct to represent a contact
    struct Contact {
        uint id; // Unique identifier for the contact
        string firstName; // First name of the contact
        string lastName; // Last name of the contact
        uint[] phoneNumbers; // Array to store multiple phone numbers for the contact
    }

    // Array to store all contacts
    Contact[] private contacts;

    // Mapping to store the index of each contact in the contacts array using its ID
    mapping(uint => uint) private idToIndex;

    // Variable to keep track of the ID for the next contact
    uint private nextId = 1;

    // Custom error for when a contact is not found
    error ContactNotFound(uint id);
