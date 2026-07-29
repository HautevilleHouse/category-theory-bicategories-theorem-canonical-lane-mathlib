import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryBicategoriesTheoremCanonicalLaneLean.BicategoriesCore
import HautevilleHouse.CategoryTheoryBicategoriesTheoremCanonicalLaneLean.AdjointEquivalence
import HautevilleHouse.CategoryTheoryBicategoriesTheoremCanonicalLaneLean.YonedaLemma

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesTheoremCanonicalLaneLean

def CategoryTheoryBicategoriesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem category_theory_bicategories_endgame (A : AdmissibleClass) :
    CategoryTheoryBicategoriesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheoryBicategoriesTheoremCanonicalLaneLean
end HautevilleHouse