import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean

structure FractureMechanicsPackage where
  stressIntensityFactor : Prop
  fractureToughness : Prop
  crackPropagation : Prop
  parisLaw : Prop

structure FractureMechanicsEvidence (F : FractureMechanicsPackage) where
  stressIntensityFactorClosed : F.stressIntensityFactor
  fractureToughnessClosed : F.fractureToughness
  crackPropagationClosed : F.crackPropagation
  parisLawClosed : F.parisLaw

def FractureMechanicsClosed (F : FractureMechanicsPackage) : Prop :=
  F.stressIntensityFactor ∧ F.fractureToughness ∧ F.crackPropagation ∧ F.parisLaw

theorem fracture_mechanics_closed_from_evidence (F : FractureMechanicsPackage) (E : FractureMechanicsEvidence F) : FractureMechanicsClosed F := by
  exact And.intro E.stressIntensityFactorClosed (And.intro E.fractureToughnessClosed (And.intro E.crackPropagationClosed E.parisLawClosed))

end MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean
end HautevilleHouse