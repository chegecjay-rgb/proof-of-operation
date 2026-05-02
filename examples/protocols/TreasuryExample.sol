// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../../integrations/PoOEmitterMixin.sol";
import "../../integrations/PoOConstants.sol";

/// @title TreasuryExample
/// @notice Example treasury contract with PoO-integrated withdrawals
contract TreasuryExample is PoOEmitterMixin {
    address public admin;

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor(address pooAddress) PoOEmitterMixin(pooAddress) {
        admin = msg.sender;
    }

    /// @notice Accept ETH deposits
    receive() external payable {}

    /// @notice Withdraw ETH from treasury
    function withdraw(address payable to, uint256 amount) external onlyAdmin {
        require(address(this).balance >= amount, "Insufficient balance");
        require(to != address(0), "Invalid recipient");

        to.transfer(amount);

        bytes32 dataHash = keccak256(abi.encode(to, amount));

        _emitOperation(
            PoOConstants.AUTHORITY_ADMIN,
            PoOConstants.OP_WITHDRAW,
            to,
            dataHash
        );
    }
}
