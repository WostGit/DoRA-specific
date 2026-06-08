# DoRA-specific

Lean 4 project for a small mechanized proof artifact about projection-bounded parameter-efficient fine-tuning.

## Current mechanized content

This repository currently contains:

- a finite-dimensional update-vector model,
- a squared-norm displacement metric,
- an abstract projection interface with squared-norm non-expansiveness,
- a LoRA-style projected displacement theorem,
- a DoRA-style directional-plus-magnitude decomposition theorem.

## Main theorem intuition

A projected update cannot retain more squared update energy than the original update signal. In this model, the LoRA-style one-step displacement is bounded by the corresponding full-update displacement.

DoRA is modeled as a projected directional channel plus a magnitude channel. The proof makes the magnitude-channel cost explicit instead of hiding it inside an informal claim.

## Build

```bash
lake update
lake build
```

## Files

```text
PeftSecurity/Core.lean
PeftSecurity/Projection.lean
PeftSecurity/DoRA.lean
PeftSecurity.lean
Main.lean
lakefile.lean
lean-toolchain
```

## Honest limitations

This is a proof-core artifact, not a complete empirical paper. It does not prove real-world neural-network behavior by itself. Stronger next steps are:

- connect the abstract projection interface to concrete LoRA matrices,
- prove a matrix-rank theorem for `B * A`,
- add expected retained-energy results under distributional assumptions,
- add full empirical evaluation scripts.
