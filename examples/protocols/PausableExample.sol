// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../../integrations/PoOEmitterMixin.sol";
import "../../integrations/PoOConstants.sol";

/// @title PausableExample
/// @notice Example protocol integrating PoO with pause/unpause functionality
contract PausableExample is PoOEmitterMixin {
    bool public paused;
    address public admin;

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor(address pooAddress) PoOEmitterMixin(pooAddress) {
        admin = msg.sender;
    }

    function pause() external onlyAdmin {
        require(!paused, "Already paused");
        paused = true;

        bytes32 dataHash = keccak256(abi.encode(paused));

        _emitOperation(
            PoOConstants.AUTHORITY_ADMIN,
            PoOConstants.OP_PAUSE,
            address(this),
            dataHash
        );
    }

    function unpause() external onlyAdmin {
        require(paused, "Not paused");
        paused = false;

        bytes32 dataHash = keccak256(abi.encode(paused));

        _emitOperation(
            PoOConstants.AUTHORITY_ADMIN,
            PoOConstants.OP_UNPAUSE,
            address(this),
            dataHash
        );
    }
}
