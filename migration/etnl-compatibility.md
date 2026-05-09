# ETNL Compatibility Guarantees

ETNL MUST compute execution equivalence using:

- target
- payloadHash

WITHOUT:
- tracing
- heuristic unpacking
- calldata array decoding
- protocol-specific parsers

Cross-protocol execution normalization MUST remain deterministic.
