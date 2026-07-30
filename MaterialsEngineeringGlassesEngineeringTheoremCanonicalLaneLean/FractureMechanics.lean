import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean

structure FractureMechanicsPackage where
  stressIntensityFactor : Type u
  crackPropagation : Prop
  criticalStress : Prop
  toughness : Prop
  subcriticalCrackGrowth : Prop
  rCurveBehavior : Prop

structure FractureMechanicsEvidence (F : FractureMechanicsPackage) where
  stressIntensityFactorClosed : F.stressIntensityFactor
  crackPropagationClosed : F.crackPropagation
  criticalStressClosed : F.criticalStress
  toughnessClosed : F.toughness
  subcriticalCrackGrowthClosed : F.subcriticalCrackGrowth
  rCurveBehaviorClosed : F.rCurveBehavior

def FractureMechanicsClosed (F : FractureMechanicsPackage) : Prop :=
  F.stressIntensityFactor ∧ F.crackPropagation ∧ F.criticalStress ∧
  F.toughness ∧ F.subcriticalCrackGrowth ∧ F.rCurveBehavior

theorem fracture_mechanics_closed_from_evidence (F : FractureMechanicsPackage)
    (E : FractureMechanicsEvidence F) : FractureMechanicsClosed F := by
  exact And.intro E.stressIntensityFactorClosed
    (And.intro E.crackPropagationClosed
      (And.intro E.criticalStressClosed
        (And.intro E.toughnessClosed
          (And.intro E.subcriticalCrackGrowthClosed E.rCurveBehaviorClosed))))

end MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
