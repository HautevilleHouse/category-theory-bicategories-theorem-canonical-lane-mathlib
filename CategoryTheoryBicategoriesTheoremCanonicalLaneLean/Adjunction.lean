import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesTheoremCanonicalLaneLean

structure AdjunctionPackage where
  leftAdjoint : Type u → Type v
  rightAdjoint : Type u → Type v
  unit : ∀ (X : Type u), X → rightAdjoint (leftAdjoint X)
  counit : ∀ (Y : Type u), leftAdjoint (rightAdjoint Y) → Y
  triangleIdentities : Prop
  universalProperty : Prop

structure AdjunctionEvidence (A : AdjunctionPackage) where
  triangleIdentitiesClosed : A.triangleIdentities
  universalPropertyClosed : A.universalProperty

def AdjunctionClosed (A : AdjunctionPackage) : Prop :=
  A.triangleIdentities ∧ A.universalProperty

theorem adjunction_closed_from_evidence (A : AdjunctionPackage) (E : AdjunctionEvidence A) : AdjunctionClosed A := by
  exact And.intro E.triangleIdentitiesClosed E.universalPropertyClosed

end CategoryTheoryBicategoriesTheoremCanonicalLaneLean
end HautevilleHouse