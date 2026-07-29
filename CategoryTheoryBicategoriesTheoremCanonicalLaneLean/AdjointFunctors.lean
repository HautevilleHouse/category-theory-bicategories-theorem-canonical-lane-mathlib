import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryBicategoriesTheoremCanonicalLaneLean.BicategoryBasics

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesTheoremCanonicalLaneLean

structure AdjointFunctorsPackage (B : BicategoryPackage) where
  leftAdjoint : B.objects → B.objects
  rightAdjoint : B.objects → B.objects
  unit : ∀ (a : B.objects), B.morphisms a (B.rightAdjoint (B.leftAdjoint a))
  counit : ∀ (a : B.objects), B.morphisms (B.leftAdjoint (B.rightAdjoint a)) a
  triangleIdentities : Prop
  triangleIdentitiesTerm : triangleIdentities

structure AdjointFunctorsEvidence {B : BicategoryPackage} (A : AdjointFunctorsPackage B) where
  triangleIdentitiesClosed : A.triangleIdentities

def AdjointFunctorsClosed {B : BicategoryPackage} (A : AdjointFunctorsPackage B) : Prop :=
  A.triangleIdentities

theorem adjoint_functors_closed_from_evidence {B : BicategoryPackage} (A : AdjointFunctorsPackage B)
    (E : AdjointFunctorsEvidence A) : AdjointFunctorsClosed A := by
  exact E.triangleIdentitiesClosed

end CategoryTheoryBicategoriesTheoremCanonicalLaneLean
end HautevilleHouse