import HautevilleHouse.CategoryTheoryBicategoriesTheoremCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : BicategoryAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BicategoryWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoryTheoryBicategoriesTheoremCanonicalLaneLean
end HautevilleHouse