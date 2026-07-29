import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesTheoremCanonicalLaneLean

structure LimitsPackage where
  diagram : Type u → Type v
  cone : ∀ (D : Type u) (c : Type v), Prop
  limitUniversalProperty : ∀ (D : Type u) (L : Type v), cone D L → (∀ (c : Type v), cone D c → (c → L)) → Prop
  completeness : Prop

structure ColimitsPackage where
  cocone : ∀ (D : Type u) (c : Type v), Prop
  colimitUniversalProperty : ∀ (D : Type u) (L : Type v), cocone D L → (∀ (c : Type v), cocone D c → (L → c)) → Prop
  cocompleteness : Prop

structure LimitsEvidence (L : LimitsPackage) where
  limitUniversalPropertyClosed : L.limitUniversalProperty
  completenessClosed : L.completeness

structure ColimitsEvidence (C : ColimitsPackage) where
  colimitUniversalPropertyClosed : C.colimitUniversalProperty
  cocompletenessClosed : C.cocompleteness

def LimitsClosed (L : LimitsPackage) : Prop :=
  L.limitUniversalProperty ∧ L.completeness

def ColimitsClosed (C : ColimitsPackage) : Prop :=
  C.colimitUniversalProperty ∧ C.cocompleteness

theorem limits_closed_from_evidence (L : LimitsPackage) (E : LimitsEvidence L) : LimitsClosed L := by
  exact And.intro E.limitUniversalPropertyClosed E.completenessClosed

theorem colimits_closed_from_evidence (C : ColimitsPackage) (E : ColimitsEvidence C) : ColimitsClosed C := by
  exact And.intro E.colimitUniversalPropertyClosed E.cocompletenessClosed

end CategoryTheoryBicategoriesTheoremCanonicalLaneLean
end HautevilleHouse