# Safe Retrofit Template

for each multisend operation:
- emit one ProofOfOperation event
- share parentOperationId across batch
- preserve deterministic operation ordering
