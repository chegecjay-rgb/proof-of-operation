// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./IProofOfOperation.sol";

/// @title ProofOfOperation
/// @notice Reference implementation that emits standardized operation logs
contract ProofOfOperation is IProofOfOperation {
    function emitOperation(bytes32 authorityId, bytes32 operationId, address target, bytes32 dataHash) external {
        emit OperationExecuted(authorityId, operationId, target, dataHash, block.timestamp);
    }
}
