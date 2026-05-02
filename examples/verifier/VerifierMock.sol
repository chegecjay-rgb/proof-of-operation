// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title VerifierMock
/// @notice Minimal demonstration of PoO ↔ Disclosure consistency checking
/// @dev NOT a full verifier — only illustrates O ⊆ D logic
contract VerifierMock {
    /// @notice Declared authority mapping (simulated disclosure)
    mapping(bytes32 => bool) public declaredAuthorities;

    /// @notice Observed operations (from PoO logs, simulated input)
    struct ObservedOperation {
        bytes32 authorityId;
        bytes32 operationId;
        address target;
        bytes32 dataHash;
    }

    ObservedOperation[] public observed;

    /// @notice Declare an authority (simulating ERC-8241 disclosure)
    function declareAuthority(bytes32 authorityId) external {
        declaredAuthorities[authorityId] = true;
    }

    /// @notice Record an observed operation (simulating log ingestion)
    function recordObserved(
        bytes32 authorityId,
        bytes32 operationId,
        address target,
        bytes32 dataHash
    ) external {
        observed.push(
            ObservedOperation({
                authorityId: authorityId,
                operationId: operationId,
                target: target,
                dataHash: dataHash
            })
        );
    }

    /// @notice Check if all observed operations are declared
    /// @return compliant TRUE if O ⊆ D
    function checkConsistency() external view returns (bool compliant) {
        for (uint256 i = 0; i < observed.length; i++) {
            if (!declaredAuthorities[observed[i].authorityId]) {
                return false;
            }
        }
        return true;
    }
}
