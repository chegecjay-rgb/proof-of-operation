// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title PoOEmitterMixin
/// @notice Lightweight helper for emitting Proof of Operation events
/// @dev Does NOT enforce access control or logic — purely a convenience layer
abstract contract PoOEmitterMixin {
    /// @notice Address of the deployed ProofOfOperation contract
    address public immutable poo;

    constructor(address pooAddress) {
        poo = pooAddress;
    }

    /// @notice Internal helper to emit PoO operation
    function _emitOperation(
        bytes32 authorityId,
        bytes32 operationId,
        address target,
        bytes32 dataHash
    ) internal {
        // low-level call to remain interface-agnostic
        (bool success, ) = poo.call(
            abi.encodeWithSignature(
                "emitOperation(bytes32,bytes32,address,bytes32)",
                authorityId,
                operationId,
                target,
                dataHash
            )
        );

        require(success, "PoO emit failed");
    }
}
