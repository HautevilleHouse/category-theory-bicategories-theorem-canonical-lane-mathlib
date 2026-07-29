import HautevilleHouse.CategoryTheoryBicategoriesTheoremCanonicalLaneLean.TheoremStatement
import HautevilleHouse.CanonicalLaneMathlibCore
import Mathlib.CategoryTheory.Bicategory.Basic

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BicategorySpace where
  carrier : Type
  bicategoryStruct : CategoryTheory.BicategoricalStructure carrier

structure BicategoryAdmittedObject where
  space : BicategorySpace
  strictified : Prop
  coherenceTheoremHolds : Prop
  pseudofunctorModel : Type
  modelStructure : CategoryTheory.BicategoricalStructure pseudofunctorModel
  biequivalenceToModel : Prop
  conclusion : biequivalenceToModel

structure BicategoryEndgameState where
  object : BicategoryAdmittedObject

def BicategoryWitnessClosed (O : BicategoryAdmittedObject) : Prop :=
  O.biequivalenceToModel

end CategoryTheoryBicategoriesTheoremCanonicalLaneLean
end HautevilleHouse