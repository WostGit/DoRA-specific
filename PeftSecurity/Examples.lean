import PeftSecurity.Projection

namespace PeftSecurity

def identityProjection (d : Nat) : Projection d where
  project := fun x => x
  nonexpansiveSq := by
    intro x
    rfl

def zeroProjection (d : Nat) : Projection d where
  project := fun _ => fun _ => 0
  nonexpansiveSq := by
    intro x
    unfold normSq
    simp

theorem identityProjectionDisplacementEq {d : Nat} (eta : Real) (g : Vec d) :
    loraDisplacementSq (identityProjection d) eta g = fullDisplacementSq eta g := by
  unfold loraDisplacementSq projectedDisplacementSq fullDisplacementSq identityProjection
  rfl

theorem zeroProjectionDisplacementEq {d : Nat} (eta : Real) (g : Vec d) :
    loraDisplacementSq (zeroProjection d) eta g = 0 := by
  unfold loraDisplacementSq projectedDisplacementSq zeroProjection normSq
  simp [lrSq]

end PeftSecurity
