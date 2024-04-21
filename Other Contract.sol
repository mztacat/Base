// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

// Import the AddressBook contract to interact with it
import "./AddressBook.sol";

// Contract for creating new instances of AddressBook
contract AddressBookFactory {
    // Define a private salt value for internal use
    string private salt = "value";

    // Function to deploy a new instance of AddressBook
    function deploy() external returns (AddressBook) {
        // Create a new instance of AddressBook
        AddressBook newAddressBook = new AddressBook();

        // Transfer ownership of the new AddressBook contract to the caller of this function
        newAddressBook.transferOwnership(msg.sender);

        // Return the newly created AddressBook contract
        return newAddressBook;
    }
}
