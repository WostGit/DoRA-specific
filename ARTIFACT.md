# Artifact Evaluation Guide

## Scope

This repository is a mechanized proof core for projection-bounded parameter-efficient fine-tuning.

It proves small mathematical facts that support the paper's formal backbone. It does not claim to mechanize empirical behavior of large neural networks.

## Mechanized claims

### Claim 1: projected displacement bound

File: `PeftSecurity/Projection.lean`

The theorem `loraProjectionBoundsDisplacement` proves that projected one-step squared displacement is bounded by full one-step squared displacement when the projection is squared-norm non-expansive.

### Claim 2: DoRA-style decomposition

File: `PeftSecurity/DoRA.lean`

The theorem `doraDisplacementDecomposition` proves that the total bound separates into a projected directional component and an explicitly bounded magnitude component.

### Claim 3: concrete instances

File: `PeftSecurity/Examples.lean`

The identity and zero projections instantiate the projection interface. These examples sanity-check the two extremes: full retention and no retention.

## Build instructions

```bash
lake update
lake build
```

A GitHub Actions workflow is provided in `.github/workflows/lean.yml`.

## Expected reviewer checks

Reviewers should verify:

1. the project builds with `lake build`,
2. `Main.lean` imports the full proof library,
3. the main theorems are checked by Lean,
4. no theorem about real-world model behavior is overstated,
5. future theorem targets are clearly separated from proved results.

## Main limitations

The current artifact does not yet include:

- concrete LoRA matrix-rank proof,
- expected retained-energy theorem,
- full privacy accounting,
- empirical scripts.

These are listed as future work rather than falsely claimed as completed.
