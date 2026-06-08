import PeftSecurity.Projection

/-!
# Concrete projection examples

These examples reduce artifact risk by showing that the abstract projection
interface is inhabited by simple concrete operators.
-/

namespace PeftSecurity

/-- Identity projection: keeps the whole update vector. -/
def identityProjection (d : Nat) : Projection d where
  project := fun x => x
  nonexpansiveSq := by
    intro x
    rfl

/-- Zero projection: keeps no update coordinates. -/
def zeroProjection (d : Nat) : Projection d where
  project := fun _ => fun _ => 0
  nonexpansiveSq := by
    intro x
    unfold normSq
    simp

/-- Identity projection exactly matches full squared displacement. -/
theorem identityProjectionDisplacementEq {d : Nat} (eta : Real) (g : Vec d) :
    loraDisplacementSq (identityProjection d) eta g = fullDisplacementSq eta g := by
  unfold loraDisplacementSq fullDisplacementSq identityProjection
  rfl

/-- Zero projection yields zero projected squared displacement. -/
theorem zeroProjectionDisplacementEq {d : Nat} (eta : Real) (g : Vec d) :
    loraDisplacementSq (zeroProjection d) eta g = 0 := by
  unfold loraDisplacementSq zeroProjection normSq
  simp [loraDisplacementSq]

end PeftSecurity
