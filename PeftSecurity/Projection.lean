import PeftSecurity.Core

/-!
# Projection model for LoRA-style update restriction

LoRA is modeled as a projection into a smaller trainable update space. The key
property used here is squared-norm non-expansiveness: projection cannot retain
more squared update energy than the original update signal.
-/

namespace PeftSecurity

/--
Abstract projection into a trainable update space.

For a concrete orthogonal projection, `nonexpansiveSq` follows from standard
Hilbert-space geometry. Here it is packaged as the interface connecting this
small artifact to a later concrete matrix/subspace formalization.
-/
structure Projection (d : Nat) where
  project : Vec d -> Vec d
  nonexpansiveSq : forall x : Vec d, normSq (project x) <= normSq x

/-- One-step LoRA-style projected squared displacement. -/
noncomputable def loraDisplacementSq {d : Nat}
    (P : Projection d) (eta : Real) (g : Vec d) : Real :=
  lrSq eta * normSq (P.project g)

/--
Theorem 1: projection-limited update displacement.

If a LoRA-style update keeps only the projected component of an update signal,
then its one-step squared displacement is no greater than full updating.
This is the mechanized version of the update-gate argument.
-/
theorem loraProjectionBoundsDisplacement {d : Nat}
    (P : Projection d) (eta : Real) (g : Vec d) :
    loraDisplacementSq P eta g <= fullDisplacementSq eta g := by
  unfold loraDisplacementSq fullDisplacementSq
  exact mul_le_mul_of_nonneg_left (P.nonexpansiveSq g) (lrSq_nonneg eta)

end PeftSecurity
