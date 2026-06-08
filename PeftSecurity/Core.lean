import Mathlib

/-!
# Core definitions for PEFT robustness proofs

This file defines a deliberately small mathematical model for one-step update
analysis. The artifact does not claim to model full neural-network training.
It proves consequences inside a clean abstraction that can later be connected
to concrete LoRA matrices and empirical measurements.
-/

namespace PeftSecurity

open scoped BigOperators

/-- A finite-dimensional update vector. -/
abbrev Vec (d : Nat) := Fin d -> Real

/-- Squared Euclidean norm. Squared norms avoid unnecessary square-root facts. -/
noncomputable def normSq {d : Nat} (x : Vec d) : Real :=
  sum Finset.univ (fun i => x i * x i)

/-- A nonnegative learning-rate square factor. -/
def lrSq (eta : Real) : Real := eta * eta

/-- One-step full-update squared displacement from an adversarial update signal. -/
noncomputable def fullDisplacementSq {d : Nat} (eta : Real) (g : Vec d) : Real :=
  lrSq eta * normSq g

/--
A clipping operator interface.

`clipBound` is the contract needed from any concrete clipping implementation:
a clipped update has squared norm at most `C^2`.
-/
structure Clipper (d : Nat) where
  clip : Vec d -> Real -> Vec d
  clipBound : forall (g : Vec d) (C : Real), 0 <= C -> normSq (clip g C) <= C * C

/-- Basic fact: a squared scalar is nonnegative. -/
theorem lrSq_nonneg (eta : Real) : 0 <= lrSq eta := by
  unfold lrSq
  exact mul_self_nonneg eta

end PeftSecurity
