import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean

structure StressTensorField where
  continuity : Prop
  symmetry : Prop
  equilibriumEquation : Prop

structure StrainTensorField where
  compatibilityCondition : Prop
  linearElasticLaw : Prop

structure ElasticityPackage (S : StressTensorField) (T : StrainTensorField) where
  constitutiveLaw : Prop
  youngModulus : ℝ
  poissonRatio : ℝ
  hookesLawFormulation : Prop
  anisotropicElasticity : Prop

structure FractureCriterion where
  stressIntensityFactor : ℝ
  criticalStressIntensity : ℝ
  fractureToughness : ℝ

structure FractureMechanicsPackage (S : StressTensorField) (F : FractureCriterion) where
  crackTipFieldAsymptotics : Prop
  energyReleaseRate : Prop
  griffithCriterion : Prop
  parisLaw : Prop
  fatigueCrackGrowth : Prop

structure ElasticityEvidence {S : StressTensorField} {T : StrainTensorField} (E : ElasticityPackage S T) where
  constitutiveLawClosed : E.constitutiveLaw
  hookesLawFormulationClosed : E.hookesLawFormulation
  anisotropicElasticityClosed : E.anisotropicElasticity

structure FractureEvidence {S : StressTensorField} {F : FractureCriterion} (M : FractureMechanicsPackage S F) where
  crackTipFieldAsymptoticsClosed : M.crackTipFieldAsymptotics
  energyReleaseRateClosed : M.energyReleaseRate
  griffithCriterionClosed : M.griffithCriterion
  parisLawClosed : M.parisLaw
  fatigueCrackGrowthClosed : M.fatigueCrackGrowth

def ElasticityClosed {S : StressTensorField} {T : StrainTensorField} (E : ElasticityPackage S T) : Prop :=
  E.constitutiveLaw ∧ E.hookesLawFormulation ∧ E.anisotropicElasticity

def FractureClosed {S : StressTensorField} {F : FractureCriterion} (M : FractureMechanicsPackage S F) : Prop :=
  M.crackTipFieldAsymptotics ∧ M.energyReleaseRate ∧ M.griffithCriterion ∧ M.parisLaw ∧ M.fatigueCrackGrowth

theorem elasticity_closed_from_evidence {S : StressTensorField} {T : StrainTensorField} (E : ElasticityPackage S T) (Ev : ElasticityEvidence E) :
    ElasticityClosed E := by
  exact And.intro Ev.constitutiveLawClosed
    (And.intro Ev.hookesLawFormulationClosed Ev.anisotropicElasticityClosed)

theorem fracture_closed_from_evidence {S : StressTensorField} {F : FractureCriterion} (M : FractureMechanicsPackage S F) (Ev : FractureEvidence M) :
    FractureClosed M := by
  exact And.intro Ev.crackTipFieldAsymptoticsClosed
    (And.intro Ev.energyReleaseRateClosed
      (And.intro Ev.griffithCriterionClosed
        (And.intro Ev.parisLawClosed Ev.fatigueCrackGrowthClosed)))

end MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean
end HautevilleHouse