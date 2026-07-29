import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesTheoremCanonicalLaneLean

structure CoherenceData where
  freeBicategory : Type u
  strictification : Type u
  coherenceMorphism : freeBicategory → strictification
  isEquivalence : IsEquivalence coherenceMorphism

structure CoherenceEvidence (D : CoherenceData) where
  freeBicategoryDefined : Prop
  strictificationDefined : Prop
  coherenceClosed : D.coherenceMorphism.IsEquivalence

def CoherenceClosed (D : CoherenceData) : Prop := D.coherenceMorphism.IsEquivalence

theorem coherence_closed_from_evidence (D : CoherenceData) (E : CoherenceEvidence D) : CoherenceClosed D := E.coherenceClosed

theorem coherence_bridge (A : AdmissibleClass) (D : CoherenceData) (h : CoherenceClosed D) : bridgeClosed A ∧ gateClosed A := by
  constructor
  · exact bridge_from_admissible_class A
  · exact gate_from_admissible_class A

end CategoryTheoryBicategoriesTheoremCanonicalLaneLean
end HautevilleHouse
