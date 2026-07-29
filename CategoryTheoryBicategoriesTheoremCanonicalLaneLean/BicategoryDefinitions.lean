import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesTheoremCanonicalLaneLean

structure BicategoryPackage where
  objects : Type u
  oneCells : objects → objects → Type v
  twoCells : ∀ {a b : objects}, (a → b) → (a → b) → Type w
  verticalComposition : ∀ {a b} {f g h : a → b}, twoCells g h → twoCells f g → twoCells f h
  horizontalComposition : ∀ {a b c} (f : a → b) (g : b → c), twoCells f g → twoCells (f ∘ g) (f ∘ g)
  associator : ∀ {a b c d} (f : a → b) (g : b → c) (h : c → d), twoCells ((f ∘ g) ∘ h) (f ∘ (g ∘ h))
  leftUnitor : ∀ {a b} (f : a → b), twoCells (id ∘ f) f
  rightUnitor : ∀ {a b} (f : a → b), twoCells (f ∘ id) f
  pentagonCondition : Prop
  triangleCondition : Prop
  coherenceLaws : Prop

structure BicategoryEvidence (B : BicategoryPackage) where
  pentagonConditionClosed : B.pentagonCondition
  triangleConditionClosed : B.triangleCondition
  coherenceLawsClosed : B.coherenceLaws

def BicategoryClosed (B : BicategoryPackage) : Prop :=
  B.pentagonCondition ∧ B.triangleCondition ∧ B.coherenceLaws

theorem bicategory_closed_from_evidence (B : BicategoryPackage) (E : BicategoryEvidence B) : BicategoryClosed B := by
  exact And.intro E.pentagonConditionClosed (And.intro E.triangleConditionClosed E.coherenceLawsClosed)

end CategoryTheoryBicategoriesTheoremCanonicalLaneLean
end HautevilleHouse