import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesTheoremCanonicalLaneLean

structure BicategoryPackage where
  objects : Type u
  morphisms : objects → objects → Type v
  twoCells : ∀ {a b : objects}, (f g : morphisms a b) → Type w
  composition1D : ∀ {a b c : objects}, morphisms b c → morphisms a b → morphisms a c
  composition2D : ∀ {a b : objects} {f g h : morphisms a b}, twoCells g h → twoCells f g → twoCells f h
  associator : ∀ {a b c d : objects} (f : morphisms a b) (g : morphisms b c) (h : morphisms c d),
      twoCells (composition1D (composition1D h g) f) (composition1D h (composition1D g f))
  leftUnitor : ∀ {a b : objects} (f : morphisms a b), twoCells (composition1D (identityMorphism b) f) f
  rightUnitor : ∀ {a b : objects} (f : morphisms a b), twoCells (composition1D f (identityMorphism a)) f
  pentagonCondition : Prop
  triangleCondition : Prop
  identityMorphism : objects → morphisms a a
  pentagonConditionTerm : pentagonCondition
  triangleConditionTerm : triangleCondition

structure BicategoryEvidence (B : BicategoryPackage) where
  pentagonConditionClosed : B.pentagonCondition
  triangleConditionClosed : B.triangleCondition

def BicategoryClosed (B : BicategoryPackage) : Prop :=
  B.pentagonCondition ∧ B.triangleCondition

theorem bicategory_closed_from_evidence (B : BicategoryPackage) (E : BicategoryEvidence B) :
    BicategoryClosed B := by
  exact And.intro E.pentagonConditionClosed E.triangleConditionClosed

end CategoryTheoryBicategoriesTheoremCanonicalLaneLean
end HautevilleHouse