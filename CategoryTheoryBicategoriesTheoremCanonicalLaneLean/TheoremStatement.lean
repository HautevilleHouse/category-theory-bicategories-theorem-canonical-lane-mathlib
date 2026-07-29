import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesTheoremCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  bicategoriesConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := "category-theory-bicategories-canonical-lane",
  theoremName := "Bicategorical Yoneda Lemma",
  theoremObject := "Equivalence between pseudofunctors and algebras",
  classicalBoundary := "Unrestricted classical bicategory theory",
  bicategoriesConstrainedStatement := "Bicategories-constrained theorem certificate internalized through bridge and gate",
  certificateLane := "bicategories_constrained",
  carriedRemainder := "carriedRemainder: bicategorical coherence conditions"
}

end CategoryTheoryBicategoriesTheoremCanonicalLaneLean
end HautevilleHouse