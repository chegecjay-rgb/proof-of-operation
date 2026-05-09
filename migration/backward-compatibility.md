# Migration Compatibility Rules

Legacy ProofOfOperation events remain valid.

Missing fields imply:
- parentOperationId = operationId
- operationIndex = 0
- operationCount = 1
- atomic execution semantics

Semantic declaration upgrades MUST remain additive.

No retrofit fragmentation is permitted.
