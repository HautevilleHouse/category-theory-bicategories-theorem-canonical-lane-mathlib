import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryBicategoriesTheoremCanonicalLaneLean.BicategoriesCore

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesTheoremCanonicalLaneLean

structure AdjointEquivalencePackage {B : BicategoryPackage} where
  leftAdj (a b : B.objects) : B.oneCells a b
  rightAdj (a b : B.objects) : B.oneCells b a
  unit (a : B.objects) : B.twoCells (B.verticalIdentity (B.oneCells a a)) (B.horizontalComposition (rightAdj a a) (leftAdj a a))
  counit (a : B.objects) : B.twoCells (B.horizontalComposition (leftAdj a a) (rightAdj a a)) (B.verticalIdentity (B.oneCells a a))
  triangleLeft (a : B.objects) : Prop
  triangleRight (a : B.objects) : Prop
  triangleLeftClosed (a : B.objects) : triangleLeft a
  triangleRightClosed (a : B.objects) : triangleRight a

structure AdjointEquivalenceEvidence {B : BicategoryPackage} (A : AdjointEquivalencePackage B) where
  triangleLeftClosedAll : ∀ (a : B.objects), A.triangleLeft a
  triangleRightClosedAll : ∀ (a : B.objects), A.triangleRight a

def AdjointEquivalenceClosed {B : BicategoryPackage} (A : AdjointEquivalencePackage B) : Prop :=
  (∀ a : B.objects, A.triangleLeft a) ∧ (∀ a : B.objects, A.triangleRight a)

theorem adjoint_equivalence_closed_from_evidence {B : BicategoryPackage}
    (A : AdjointEquivalencePackage B) (E : AdjointEquivalenceEvidence A) :
    AdjointEquivalenceClosed A := by
  exact And.intro E.triangleLeftClosedAll E.triangleRightClosedAll

end CategoryTheoryBicategoriesTheoremCanonicalLaneLean
end HautevilleHouse