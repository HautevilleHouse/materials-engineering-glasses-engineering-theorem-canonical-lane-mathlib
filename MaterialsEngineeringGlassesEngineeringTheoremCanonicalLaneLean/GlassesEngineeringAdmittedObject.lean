import MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean

structure MaterialsEngineeringAdmittedObject where
  material : Type u
  processingConditions : Prop
  glassesFormation : Prop
  networkFormerConnectivity : Prop
  propertySpecification : Prop
  glassesFormationClosed : glassesFormation
  networkFormerConnectivityClosed : networkFormerConnectivity
  propertySpecificationClosed : propertySpecification
  conclusion : glassesFormation ∧ networkFormerConnectivity ∧ propertySpecification

def MaterialsEngineeringWitnessClosed (O : MaterialsEngineeringAdmittedObject) : Prop :=
  O.glassesFormation ∧ O.networkFormerConnectivity ∧ O.propertySpecification

end MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean
end HautevilleHouse