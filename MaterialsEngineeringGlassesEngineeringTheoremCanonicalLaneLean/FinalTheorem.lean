import canonicalLaneMathlib.MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean

def ConstrainedGlassesEngineeringClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_glasses_engineering_endgame (A : AdmissibleClass) :
    ConstrainedGlassesEngineeringClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
