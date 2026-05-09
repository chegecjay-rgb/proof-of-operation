# Batch Topology Rules

- operations belonging to the same execution batch MUST share parentOperationId
- operationIndex MUST preserve deterministic ordering
- operationCount MUST remain constant across batch members
- batch topology MUST remain reconstructable without tracing
