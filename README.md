# Proof of Operation (PoO)

Minimal standard for recording execution of privileged protocol actions.

## Event

OperationExecuted(
    bytes32 authorityId,
    bytes32 operationId,
    address target,
    bytes32 dataHash,
    uint256 timestamp
)

## Behavior

- Records execution only
- Does not enforce policy
- Does not score trust
- Does not interpret governance

## Verifier Use

Compare declared operations against observed PoO logs using set logic:

- O ⊆ D → compliant
- O \ D ≠ ∅ → undeclared execution
- D \ O → informational only
