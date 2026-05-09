// Governor Execution Retrofit Example

emit ProofOfOperation(
    operationId,
    SYSTEM_ID,
    msg.sender,
    target,
    value,
    keccak256(calldataPayload),
    proposalRoot,
    0,
    operationIndex,
    operationCount
);
