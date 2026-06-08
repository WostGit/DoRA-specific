import PeftSecurity.Projection

namespace PeftSecurity

noncomputable def doraDisplacementBoundSq {d : Nat}
    (P : Projection d) (eta : Real)
    (directionSignal magnitudeSignal : Vec d) : Real :=
  loraDisplacementSq P eta directionSignal + fullDisplacementSq eta magnitudeSignal

def BoundedMagnitudeChannelSq {d : Nat}
    (eta beta : Real) (magnitudeSignal referenceSignal : Vec d) : Prop :=
  fullDisplacementSq eta magnitudeSignal <= beta * fullDisplacementSq eta referenceSignal

theorem doraDisplacementDecomposition {d : Nat}
    (P : Projection d) (eta beta : Real)
    (directionSignal magnitudeSignal referenceSignal : Vec d)
    (hMag : BoundedMagnitudeChannelSq eta beta magnitudeSignal referenceSignal) :
    doraDisplacementBoundSq P eta directionSignal magnitudeSignal <=
      fullDisplacementSq eta directionSignal +
      beta * fullDisplacementSq eta referenceSignal := by
  unfold doraDisplacementBoundSq BoundedMagnitudeChannelSq at *
  exact add_le_add (loraProjectionBoundsDisplacement P eta directionSignal) hMag

end PeftSecurity
