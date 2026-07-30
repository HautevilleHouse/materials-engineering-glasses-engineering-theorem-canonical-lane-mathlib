import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean

structure ElasticityPackage where
  stressStrainRelation : Prop
  elasticModuli : Prop
  poissonRatio : Prop
  yieldCriterion : Prop

structure ElasticityEvidence (E : ElasticityPackage) where
  stressStrainRelationClosed : E.stressStrainRelation
  elasticModuliClosed : E.elasticModuli
  poissonRatioClosed : E.poissonRatio
  yieldCriterionClosed : E.yieldCriterion

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.stressStrainRelation ∧ E.elasticModuli ∧ E.poissonRatio ∧ E.yieldCriterion

theorem elasticity_closed_from_evidence (E : ElasticityPackage) (Ev : ElasticityEvidence E) : ElasticityClosed E := by
  exact And.intro Ev.stressStrainRelationClosed (And.intro Ev.elasticModuliClosed (And.intro Ev.poissonRatioClosed Ev.yieldCriterionClosed))

end MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean
end HautevilleHouse