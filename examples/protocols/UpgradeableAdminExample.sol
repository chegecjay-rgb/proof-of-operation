// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../../integrations/PoOEmitterMixin.sol";
import "../../integrations/PoOConstants.sol";

/// @title UpgradeableAdminExample
/// @notice Example admin contract simulating upgradeable proxy control with PoO integration
contract UpgradeableAdminExample is PoOEmitterMixin {
    address public admin;
    address public implementation;

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor(address pooAddress, address initialImplementation)
        PoOEmitterMixin(pooAddress)
    {
        admin = msg.sender;
        implementation = initialImplementation;
    }

    /// @notice Simulated upgrade function
    function upgrade(address newImplementation) external onlyAdmin {
        require(newImplementation != address(0), "Invalid implementation");

        implementation = newImplementation;

        bytes32 dataHash = keccak256(abi.encode(newImplementation));

        _emitOperation(
            PoOConstants.AUTHORITY_ADMIN,
            PoOConstants.OP_UPGRADE,
            newImplementation,
            dataHash
        );
    }
}
