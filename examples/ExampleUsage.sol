// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../contracts/IProofOfOperation.sol";

contract ExampleUsage {
    address public poo;

    constructor(address pooAddress) {
        poo = pooAddress;
    }

    function upgradeProtocol(address newImplementation) external {
        bytes32 authorityId = keccak256("GOVERNANCE");
        bytes32 operationId = keccak256("UPGRADE");
        bytes32 dataHash = keccak256(abi.encode(newImplementation));

        (bool success, ) = poo.call(
            abi.encodeWithSignature(
                "emitOperation(bytes32,bytes32,address,bytes32)",
                authorityId,
                operationId,
                newImplementation,
                dataHash
            )
        );

        require(success, "PoO emission failed");
    }
}
