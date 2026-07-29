import HautevilleHouse.CategoryTheoryBicategoriesTheoremCanonicalLaneLean.RiemannianCurvature

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesTheoremCanonicalLaneLean

structure CoherencePackage where
  associatorConstraints : Prop
  unitorConstraints : Prop
  pentagonIdentity : Prop
  triangleIdentity : Prop
  coherenceTheoremConclusion : Prop

structure CoherenceEvidence (C : CoherencePackage) where
  associatorConstraintsClosed : C.associatorConstraints
  unitorConstraintsClosed : C.unitorConstraints
  pentagonIdentityClosed : C.pentagonIdentity
  triangleIdentityClosed : C.triangleIdentity
  coherenceTheoremConclusionClosed : C.coherenceTheoremConclusion

def CoherenceClosed (C : CoherencePackage) : Prop :=
  C.associatorConstraints ∧ C.unitorConstraints ∧ C.pentagonIdentity ∧ C.triangleIdentity ∧ C.coherenceTheoremConclusion

theorem coherence_closed_from_evidence (C : CoherencePackage) (E : CoherenceEvidence C) : CoherenceClosed C := by
  exact And.intro E.associatorConstraintsClosed
    (And.intro E.unitorConstraintsClosed
      (And.intro E.pentagonIdentityClosed
        (And.intro E.triangleIdentityClosed E.coherenceTheoremConclusionClosed)))

end CategoryTheoryBicategoriesTheoremCanonicalLaneLean
end HautevilleHouse