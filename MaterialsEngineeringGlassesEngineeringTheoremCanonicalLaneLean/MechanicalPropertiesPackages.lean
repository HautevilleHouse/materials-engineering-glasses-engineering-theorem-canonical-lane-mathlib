import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean

struct HardnessMeasurement where
  indentationLoad : ℝ
  indentationDepth : ℝ
  hardnessValue : ℝ

struct FractureToughnessMeasurement where
  crackLength : ℝ
  appliedStress : ℝ
  toughnessValue : ℝ

struct MechanicalPropertiesPackage (H : HardnessMeasurement) (K : FractureToughnessMeasurement) where
  hardnessScalingLaw : Prop
  vickersHardnessModel : Prop
  fractureToughnessModel : Prop
  brittlenessIndex : Prop
  wearResistanceCorrelation : Prop

struct MechanicalPropertiesEvidence {H : HardnessMeasurement} {K : FractureToughnessMeasurement} (P : MechanicalPropertiesPackage H K) where
  hardnessScalingLawClosed : P.hardnessScalingLaw
  vickersHardnessModelClosed : P.vickersHardnessModel
  fractureToughnessModelClosed : P.fractureToughnessModel
  brittlenessIndexClosed : P.brittlenessIndex
  wearResistanceCorrelationClosed : P.wearResistanceCorrelation

def MechanicalPropertiesClosed {H : HardnessMeasurement} {K : FractureToughnessMeasurement} (P : MechanicalPropertiesPackage H K) : Prop :=
  P.hardnessScalingLaw ∧ P.vickersHardnessModel ∧ P.fractureToughnessModel ∧ P.brittlenessIndex ∧ P.wearResistanceCorrelation

theorem mechanical_properties_closed_from_evidence {H : HardnessMeasurement} {K : FractureToughnessMeasurement} (P : MechanicalPropertiesPackage H K) (E : MechanicalPropertiesEvidence P) :
    MechanicalPropertiesClosed P := by
  exact And.intro E.hardnessScalingLawClosed
    (And.intro E.vickersHardnessModelClosed
      (And.intro E.fractureToughnessModelClosed
        (And.intro E.brittlenessIndexClosed E.wearResistanceCorrelationClosed)))

end MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean
end HautevilleHouse