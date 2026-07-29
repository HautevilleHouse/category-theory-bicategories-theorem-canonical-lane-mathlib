import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesTheoremCanonicalLaneLean

structure YonedaPackage where
  category : Type u
  homSet : category → category → Type v
  identityMorphism : ∀ (A : category), homSet A A
  composition : ∀ {A B C : category}, homSet B C → homSet A B → homSet A C
  associativity : Prop
  identityLeft : Prop
  identityRight : Prop
  representableFunctor : category → Type w
  yonedaEmbedding : ∀ (A : category), homSet A A → representableFunctor A
  fullyFaithful : Prop
  fullyFaithfulClosed : fullyFaithful

structure YonedaEvidence (Y : YonedaPackage) where
  associativityClosed : Y.associativity
  identityLeftClosed : Y.identityLeft
  identityRightClosed : Y.identityRight
  fullyFaithfulClosed : Y.fullyFaithful

def YonedaClosed (Y : YonedaPackage) : Prop :=
  Y.associativity ∧ Y.identityLeft ∧ Y.identityRight ∧ Y.fullyFaithful

theorem yoneda_closed_from_evidence (Y : YonedaPackage) (E : YonedaEvidence Y) :
    YonedaClosed Y := by
  exact And.intro E.associativityClosed
    (And.intro E.identityLeftClosed
      (And.intro E.identityRightClosed E.fullyFaithfulClosed))

end CategoryTheoryBicategoriesTheoremCanonicalLaneLean
end HautevilleHouse