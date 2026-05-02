// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../contracts/ProofOfOperation.sol";

contract ProofOfOperationTest is Test {
    ProofOfOperation poo;

    // redeclare event for testing
    event OperationExecuted(
        bytes32 indexed authorityId,
        bytes32 indexed operationId,
        address indexed target,
        bytes32 dataHash,
        uint256 timestamp
    );

    function setUp() public {
        poo = new ProofOfOperation();
    }

    function testEmitOperation() public {
        bytes32 authorityId = keccak256("ADMIN");
        bytes32 operationId = keccak256("PAUSE");
        address target = address(0x1234);
        bytes32 dataHash = keccak256("data");

        vm.expectEmit(true, true, true, true);

        emit OperationExecuted(authorityId, operationId, target, dataHash, block.timestamp);

        poo.emitOperation(authorityId, operationId, target, dataHash);
    }
}
