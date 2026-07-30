import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean

structure ElasticityPackage where
  youngModulus : Type u
  shearModulus : Type v
  poissonRatio : Type w
  stressStrainTensor : Type x
  constitutiveLaw : Prop
  isotropicCondition : Prop
  linearElasticRegion : Prop
  viscoelasticDamping : Prop

structure ElasticityEvidence (E : ElasticityPackage) where
  youngModulusClosed : E.youngModulus
  shearModulusClosed : E.shearModulus
  poissonRatioClosed : E.poissonRatio
  stressStrainTensorClosed : E.stressStrainTensor
  constitutiveLawClosed : E.constitutiveLaw
  isotropicConditionClosed : E.isotropicCondition
  linearElasticRegionClosed : E.linearElasticRegion
  viscoelasticDampingClosed : E.viscoelasticDamping

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.youngModulus ∧ E.shearModulus ∧ E.poissonRatio ∧ E.stressStrainTensor ∧
  E.constitutiveLaw ∧ E.isotropicCondition ∧ E.linearElasticRegion ∧ E.viscoelasticDamping

theorem elasticity_closed_from_evidence (E : ElasticityPackage)
    (Ev : ElasticityEvidence E) : ElasticityClosed E := by
  exact And.intro Ev.youngModulusClosed
    (And.intro Ev.shearModulusClosed
      (And.intro Ev.poissonRatioClosed
        (And.intro Ev.stressStrainTensorClosed
          (And.intro Ev.constitutiveLawClosed
            (And.intro Ev.isotropicConditionClosed
              (And.intro Ev.linearElasticRegionClosed Ev.viscoelasticDampingClosed))))))

end MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
