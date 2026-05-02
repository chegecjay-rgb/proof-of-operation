// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title PoOAdapter
/// @notice External adapter for emitting Proof of Operation events
/// @dev Designed for protocols that cannot inherit mixins
contract PoOAdapter {
    /// @notice Address of the ProofOfOperation contract
    address public immutable poo;

    constructor(address pooAddress) {
        poo = pooAddress;
    }

    /// @notice Forwards operation data to PoO emitter
    function emitOperation(
        bytes32 authorityId,
        bytes32 operationId,
        address target,
        bytes32 dataHash
    ) external {
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
