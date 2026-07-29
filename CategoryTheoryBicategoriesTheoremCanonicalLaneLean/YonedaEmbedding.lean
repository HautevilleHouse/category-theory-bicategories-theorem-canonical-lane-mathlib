import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesTheoremCanonicalLaneLean

structure Presheaf (C : Type u) [Category.{v} C] where
  op : Cᵒᵖ ⥤ Type w

structure YonedaEmbedding (C : Type u) [Category.{v} C] where
  yoneda : C ⥤ Presheaf C
  fullyFaithful : FullyFaithful yoneda
  naturality : Prop
  yonedaLemma : (X : C) (F : Presheaf C) → (yoneda.obj X ⟶ F) ≃ F.obj (Opposite.op X)

structure YonedaBridge (C : Type u) [Category.{v} C] (A : AdmissibleClass) where
  embedding : YonedaEmbedding C
  bridgeClosed : bridgeClosed A
  gateClosed : gateClosed A

theorem yoneda_embedding_closed (C : Type u) [Category.{v} C] (A : AdmissibleClass) (Y : YonedaEmbedding C) : bridgeClosed A ∧ gateClosed A := by
  constructor
  · exact Y.bridgeClosed
  · exact Y.gateClosed

end CategoryTheoryBicategoriesTheoremCanonicalLaneLean
end HautevilleHouse
