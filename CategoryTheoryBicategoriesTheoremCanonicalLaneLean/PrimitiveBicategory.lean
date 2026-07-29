import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesTheoremCanonicalLaneLean

structure PrimitiveBicategory where
  Objects : Type u
  OneCells : Objects → Objects → Type v
  TwoCells : {a b : Objects} → OneCells a b → OneCells a b → Type w
  verticalComposite : {a b : Objects} {f g h : OneCells a b} → TwoCells f g → TwoCells g h → TwoCells f h
  verticalAssoc : {a b : Objects} {f g h k : OneCells a b} (α : TwoCells f g) (β : TwoCells g h) (γ : TwoCells h k) : verticalComposite (verticalComposite α β) γ = verticalComposite α (verticalComposite β γ)
  verticalId : {a b : Objects} (f : OneCells a b) → TwoCells f f
  verticalIdLeft : {a b : Objects} {f g : OneCells a b} (α : TwoCells f g) → verticalComposite (verticalId f) α = α
  verticalIdRight : {a b : Objects} {f g : OneCells a b} (α : TwoCells f g) → verticalComposite α (verticalId g) = α
  horizontalComposite : {a b c : Objects} (f : OneCells a b) (g : OneCells b c) → OneCells a c
  horizontalId : (a : Objects) → OneCells a a
  associator : {a b c d : Objects} (f : OneCells a b) (g : OneCells b c) (h : OneCells c d) → TwoCells (horizontalComposite (horizontalComposite f g) h) (horizontalComposite f (horizontalComposite g h))
  leftUnitor : {a b : Objects} (f : OneCells a b) → TwoCells (horizontalComposite (horizontalId a) f) f
  rightUnitor : {a b : Objects} (f : OneCells a b) → TwoCells (horizontalComposite f (horizontalId b)) f
  pentagon : {a b c d e : Objects} (f : OneCells a b) (g : OneCells b c) (h : OneCells c d) (i : OneCells d e) → ... := by
    sorry
  triangle : {a b c : Objects} (f : OneCells a b) (g : OneCells b c) → ... := by
    sorry
  twoCellsSet : {a b : Objects} (f g : OneCells a b) → Set (TwoCells f g)

end CategoryTheoryBicategoriesTheoremCanonicalLaneLean
end HautevilleHouse
