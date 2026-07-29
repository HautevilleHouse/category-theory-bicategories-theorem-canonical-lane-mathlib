import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesTheoremCanonicalLaneLean

structure BicategoryPackage where
  objects : Type u
  oneCells : objects → objects → Type v
  twoCells : ∀ {a b : objects}, oneCells a b → oneCells a b → Type w
  verticalComposition : ∀ {a b : objects} {f g h : oneCells a b},
    twoCells g h → twoCells f g → twoCells f h
  verticalAssociativity : Prop
  verticalIdentity : ∀ {a b : objects} (f : oneCells a b), twoCells f f
  horizontalComposition : ∀ {a b c : objects},
    oneCells b c → oneCells a b → oneCells a c
  horizontalCompositionNatural : Prop
  associator : ∀ {a b c d : objects} (f : oneCells c d) (g : oneCells b c) (h : oneCells a b),
    twoCells (horizontalComposition f (horizontalComposition g h)) (horizontalComposition (horizontalComposition f g) h)
  leftUnitor : ∀ {a b : objects} (f : oneCells a b),
    twoCells (horizontalComposition (verticalIdentity (oneCells b b ???)) f) f
  rightUnitor : ∀ {a b : objects} (f : oneCells a b),
    twoCells (horizontalComposition f (verticalIdentity (oneCells a a ???))) f
  pentagonIdentity : Prop
  triangleIdentity : Prop

structure BicategoryEvidence (B : BicategoryPackage) where
  verticalAssociativityClosed : B.verticalAssociativity
  horizontalCompositionNaturalClosed : B.horizontalCompositionNatural
  pentagonIdentityClosed : B.pentagonIdentity
  triangleIdentityClosed : B.triangleIdentity

def BicategoryClosed (B : BicategoryPackage) : Prop :=
  B.verticalAssociativity ∧ B.horizontalCompositionNatural ∧
  B.pentagonIdentity ∧ B.triangleIdentity

theorem bicategory_closed_from_evidence (B : BicategoryPackage) (E : BicategoryEvidence B) :
    BicategoryClosed B := by
  exact And.intro E.verticalAssociativityClosed
    (And.intro E.horizontalCompositionNaturalClosed
      (And.intro E.pentagonIdentityClosed E.triangleIdentityClosed))

end CategoryTheoryBicategoriesTheoremCanonicalLaneLean
end HautevilleHouse