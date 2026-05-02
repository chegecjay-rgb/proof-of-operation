// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IProofOfOperation
/// @notice Minimal interface for emitting Proof of Operation events
interface IProofOfOperation {
    event OperationExecuted(
        bytes32 indexed authorityId,
        bytes32 indexed operationId,
        address indexed target,
        bytes32 dataHash,
        uint256 timestamp
    );
}
