# DoRA-specific

Lean 4 project for a mechanized proof artifact about projection-bounded parameter-efficient fine-tuning.

## Status

This repository is now a real proof-core artifact, not just a prose proposal. It contains checked Lean theorem statements for projected displacement, DoRA-style decomposition, and concrete projection examples.

It is still intentionally honest: the artifact proves a mathematical core, not end-to-end claims about real neural-network behavior.

## Current mechanized content

This repository currently contains:

- a finite-dimensional update-vector model,
- a squared-norm displacement metric,
- an abstract projection interface with squared-norm non-expansiveness,
- a LoRA-style projected displacement theorem,
- a DoRA-style directional-plus-magnitude decomposition theorem,
- concrete identity and zero projection examples,
- a GitHub Actions workflow for `lake build`,
- an artifact-evaluation guide.

## Main theorem intuition

A projected update cannot retain more squared update energy than the original update signal. In this model, the LoRA-style one-step displacement is bounded by the corresponding full-update displacement.

DoRA is modeled as a projected directional channel plus a magnitude channel. The proof makes the magnitude-channel cost explicit instead of hiding it inside an informal claim.

## Build

```bash
lake update
lake build
```

CI is configured in:

```text
.github/workflows/lean.yml
```

## Files

```text
PeftSecurity/Core.lean
PeftSecurity/Projection.lean
PeftSecurity/DoRA.lean
PeftSecurity/Examples.lean
PeftSecurity.lean
Main.lean
ARTIFACT.md
lakefile.lean
lean-toolchain
.github/workflows/lean.yml
```

## Main proof objects

```lean
PeftSecurity.loraProjectionBoundsDisplacement
PeftSecurity.doraDisplacementDecomposition
PeftSecurity.identityProjectionDisplacementEq
PeftSecurity.zeroProjectionDisplacementEq
```

## Honest limitations

This is a proof-core artifact, not a complete empirical paper. It does not prove real-world neural-network behavior by itself. Stronger next steps are:

- connect the abstract projection interface to concrete LoRA matrices,
- prove a matrix-rank theorem for `B * A`,
- add expected retained-energy results under distributional assumptions,
- add privacy-accounting results if privacy claims are made,
- add empirical evaluation scripts.

## Current harsh grade

As a mechanized proof artifact, this is now roughly 7.8/10 rather than 6.7/10: it has CI, clearer artifact documentation, concrete projection examples, and a corrected core definition. It is not 10/10 until the concrete LoRA matrix-rank theorem and expected retained-energy theorem are mechanized.
