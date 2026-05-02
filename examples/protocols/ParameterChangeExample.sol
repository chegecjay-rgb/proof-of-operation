// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../../integrations/PoOEmitterMixin.sol";
import "../../integrations/PoOConstants.sol";

/// @title ParameterChangeExample
/// @notice Example contract demonstrating parameter updates with PoO integration
contract ParameterChangeExample is PoOEmitterMixin {
    address public admin;
    uint256 public feeBps; // fee in basis points

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor(address pooAddress, uint256 initialFeeBps)
        PoOEmitterMixin(pooAddress)
    {
        admin = msg.sender;
        feeBps = initialFeeBps;
    }

    /// @notice Update fee parameter
    function setFee(uint256 newFeeBps) external onlyAdmin {
        require(newFeeBps <= 10_000, "Fee too high");

        feeBps = newFeeBps;

        bytes32 dataHash = keccak256(abi.encode(newFeeBps));

        _emitOperation(
            PoOConstants.AUTHORITY_ADMIN,
            PoOConstants.OP_PARAMETER_CHANGE,
            address(this),
            dataHash
        );
    }
}
