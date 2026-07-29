import HautevilleHouse.CategoryTheoryBicategoriesTheoremCanonicalLaneLean.BicategoricalCoherence

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesTheoremCanonicalLaneLean

structure PseudofunctorPackage where
  sourceBicategory : Type u
  targetBicategory : Type v
  sourceStructure : CategoryTheory.BicategoricalStructure sourceBicategory
  targetStructure : CategoryTheory.BicategoricalStructure targetBicategory
  pseudofunctorMap : sourceBicategory → targetBicategory
  coherenceCells : Prop
  identityPreservation : Prop
  compositionPreservation : Prop
  coherenceConditionsSatisfied : Prop

structure PseudofunctorEvidence (P : PseudofunctorPackage) where
  coherenceCellsClosed : P.coherenceCells
  identityPreservationClosed : P.identityPreservation
  compositionPreservationClosed : P.compositionPreservation
  coherenceConditionsSatisfiedClosed : P.coherenceConditionsSatisfied

def PseudofunctorClosed (P : PseudofunctorPackage) : Prop :=
  P.coherenceCells ∧ P.identityPreservation ∧ P.compositionPreservation ∧ P.coherenceConditionsSatisfied

theorem pseudofunctor_closed_from_evidence (P : PseudofunctorPackage) (E : PseudofunctorEvidence P) : PseudofunctorClosed P := by
  exact And.intro E.coherenceCellsClosed
    (And.intro E.identityPreservationClosed
      (And.intro E.compositionPreservationClosed E.coherenceConditionsSatisfiedClosed))

end CategoryTheoryBicategoriesTheoremCanonicalLaneLean
end HautevilleHouse