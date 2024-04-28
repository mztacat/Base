// SPDX-License-Identifier: MIT use this instead ( // SPDX-License-Identifier: GPL-3.0 )
pragma solidity ^0.8.8;

import "@openzeppelin/contracts/access/Ownable.sol";

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

    // Function to add a new contact
    function addContact(string calldata firstName, string calldata lastName, uint[] calldata phoneNumbers) external onlyOwner {
        // Create a new contact with the provided details and add it to the contacts array
        contacts.push(Contact(nextId, firstName, lastName, phoneNumbers));
        // Map the ID of the new contact to its index in the array
        idToIndex[nextId] = contacts.length - 1;
        // Increment the nextId for the next contact
        nextId++;
    }

    // Function to delete a contact by its ID
    function deleteContact(uint id) external onlyOwner {
        // Get the index of the contact to be deleted
        uint index = idToIndex[id];
        // Check if the index is valid and if the contact with the provided ID exists
        if (index >= contacts.length || contacts[index].id != id) revert ContactNotFound(id);

        // Replace the contact to be deleted with the last contact in the array
        contacts[index] = contacts[contacts.length - 1];
        // Update the index mapping for the moved contact
        idToIndex[contacts[index].id] = index;
        // Remove the last contact from the array
        contacts.pop();
        // Delete the mapping entry for the deleted contact ID
        delete idToIndex[id];
    }

    // Function to retrieve a contact by its ID
    function getContact(uint id) external view returns (Contact memory) {
        // Get the index of the contact
        uint index = idToIndex[id];
        // Check if the index is valid and if the contact with the provided ID exists
        if (index >= contacts.length || contacts[index].id != id) revert ContactNotFound(id);
        // Return the contact details
        return contacts[index];
    }

    // Function to retrieve all contacts
    function getAllContacts() external view returns (Contact[] memory) {
        // Return the array of all contacts
        return contacts;
    }
}
