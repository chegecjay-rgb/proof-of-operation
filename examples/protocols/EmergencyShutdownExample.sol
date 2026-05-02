// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../../integrations/PoOEmitterMixin.sol";
import "../../integrations/PoOConstants.sol";

/// @title EmergencyShutdownExample
/// @notice Demonstrates emergency shutdown with PoO emission
contract EmergencyShutdownExample is PoOEmitterMixin {
    address public admin;
    bool public shutdown;

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    modifier notShutdown() {
        require(!shutdown, "System shutdown");
        _;
    }

    constructor(address pooAddress) PoOEmitterMixin(pooAddress) {
        admin = msg.sender;
    }

    /// @notice Trigger emergency shutdown
    function emergencyShutdown() external onlyAdmin notShutdown {
        shutdown = true;

        bytes32 dataHash = keccak256(abi.encode(shutdown));

        _emitOperation(
            PoOConstants.AUTHORITY_ADMIN,
            PoOConstants.OP_EMERGENCY_SHUTDOWN,
            address(this),
            dataHash
        );
    }

    /// @notice Example function blocked after shutdown
    function doSomething() external notShutdown {
        // normal operation
    }
}
