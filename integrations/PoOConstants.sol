// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title PoOConstants
/// @notice Canonical identifiers for authorities and operations
/// @dev Optional helper — does NOT enforce semantics
library PoOConstants {
    // Authorities
    bytes32 internal constant AUTHORITY_ADMIN = keccak256("ADMIN");
    bytes32 internal constant AUTHORITY_GOVERNANCE = keccak256("GOVERNANCE");
    bytes32 internal constant AUTHORITY_OWNER = keccak256("OWNER");

    // Operations
    bytes32 internal constant OP_PAUSE = keccak256("PAUSE");
    bytes32 internal constant OP_UNPAUSE = keccak256("UNPAUSE");
    bytes32 internal constant OP_UPGRADE = keccak256("UPGRADE");
    bytes32 internal constant OP_WITHDRAW = keccak256("WITHDRAW");
    bytes32 internal constant OP_PARAMETER_CHANGE = keccak256("PARAMETER_CHANGE");
    bytes32 internal constant OP_EMERGENCY_SHUTDOWN = keccak256("EMERGENCY_SHUTDOWN");
}
