// Safe Multisend Retrofit Example

emit ProofOfOperation(
    operationId,
    SYSTEM_ID,
    address(this),
    target,
    value,
    keccak256(data),
    parentOperationId,
    executionContext,
    operationIndex,
    operationCount
);
