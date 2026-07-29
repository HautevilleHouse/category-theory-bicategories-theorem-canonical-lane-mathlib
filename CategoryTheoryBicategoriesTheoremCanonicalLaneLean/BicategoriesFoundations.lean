import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesTheoremCanonicalLaneLean

structure BicategoryStructure where
  objects : Type u
  homCategories : objects → objects → Type v
  identity : (a : objects) → homCategories a a
  composition : {a b c : objects} → homCategories a b → homCategories b c → homCategories a c
  associator : {a b c d : objects} (f : homCategories a b) (g : homCategories b c) (h : homCategories c d) →
    composition (composition f g) h ≅ composition f (composition g h)
  leftUnitor : {a b : objects} (f : homCategories a b) → composition (identity a) f ≅ f
  rightUnitor : {a b : objects} (f : homCategories a b) → composition f (identity b) ≅ f
  pentagonCondition : Prop
  triangleCondition : Prop

def BicategoryWitnessClosed (B : BicategoryStructure) : Prop :=
  B.pentagonCondition ∧ B.triangleCondition

structure AdmittedObject where
  space : BicategoryStructure
  conclusion : BicategoryWitnessClosed space

end CategoryTheoryBicategoriesTheoremCanonicalLaneLean
end HautevilleHouse