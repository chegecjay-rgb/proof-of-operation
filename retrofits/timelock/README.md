# Timelock Retrofit Template

for each scheduled execution:
- emit one ProofOfOperation event
- executionContext SHOULD use SCHEDULED
- preserve deterministic execution ordering
