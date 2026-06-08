import PeftSecurity.Core

/-!
# Projection-bounded update displacement
-/

namespace PeftSecurity

structure Projection (d : Nat) where
  project : Vec d -> Vec d
  nonexpansiveSq : forall x : Vec d, normSq (project x) <= normSq x

noncomputable def projectedDisplacementSq {d : Nat}
    (P : Projection d) (eta : Real) (g : Vec d) : Real :=
  lrSq eta * normSq (P.project g)

theorem projectionBoundsDisplacement {d : Nat}
    (P : Projection d) (eta : Real) (g : Vec d) :
    projectedDisplacementSq P eta g <= fullDisplacementSq eta g := by
  unfold projectedDisplacementSq fullDisplacementSq
  exact mul_le_mul_of_nonneg_left (P.nonexpansiveSq g) (lrSq_nonneg eta)

abbrev loraDisplacementSq := projectedDisplacementSq

theorem loraProjectionBoundsDisplacement {d : Nat}
    (P : Projection d) (eta : Real) (g : Vec d) :
    loraDisplacementSq P eta g <= fullDisplacementSq eta g := by
  exact projectionBoundsDisplacement P eta g

end PeftSecurity
