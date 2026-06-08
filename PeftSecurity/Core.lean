import Mathlib

/-!
# Core definitions

This file defines a small finite-dimensional one-step update model.
The model is intentionally modest: it proves mathematical facts about
projected update displacement, not end-to-end behavior of neural networks.
-/

namespace PeftSecurity

open scoped BigOperators

abbrev Vec (d : Nat) := Fin d -> Real

noncomputable def normSq {d : Nat} (x : Vec d) : Real :=
  Finset.univ.sum (fun i : Fin d => x i * x i)

def lrSq (eta : Real) : Real := eta * eta

noncomputable def fullDisplacementSq {d : Nat} (eta : Real) (g : Vec d) : Real :=
  lrSq eta * normSq g

theorem lrSq_nonneg (eta : Real) : 0 <= lrSq eta := by
  unfold lrSq
  exact mul_self_nonneg eta

end PeftSecurity
