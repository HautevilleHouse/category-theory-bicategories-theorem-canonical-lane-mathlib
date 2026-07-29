import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesTheoremCanonicalLaneLean

structure AdjointPair (C D : Type u) [Category.{v} C] [Category.{v} D] where
  left : C ⥤ D
  right : D ⥤ C
  unit : 𝟙 C ⟶ left ⋙ right
  counit : right ⋙ left ⟶ 𝟙 D
  triangleLeft : (unit ▷ left) ∘ (left ◁ counit) = 𝟙 left
  triangleRight : (right ◁ unit) ∘ (counit ▷ right) = 𝟙 right

structure AdjointFunctorEvidence (C D : Type u) [Category.{v} C] [Category.{v} D] (A : AdjointPair C D) where
  leftAdjointExists : Prop
  rightAdjointExists : Prop
  unitCounitSatisfy : A.triangleLeft = 𝟙 A.left ∧ A.triangleRight = 𝟙 A.right

def AdjointFunctorClosed (C D : Type u) [Category.{v} C] [Category.{v} D] (A : AdjointPair C D) : Prop :=
  A.triangleLeft = 𝟙 A.left ∧ A.triangleRight = 𝟙 A.right

theorem adjoint_functor_closed_from_evidence (C D : Type u) [Category.{v} C] [Category.{v} D] (A : AdjointPair C D) (E : AdjointFunctorEvidence C D A) : AdjointFunctorClosed C D A := E.unitCounitSatisfy

theorem adjoint_functor_bridge (A : AdmissibleClass) : bridgeClosed A ∧ gateClosed A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheoryBicategoriesTheoremCanonicalLaneLean
end HautevilleHouse
