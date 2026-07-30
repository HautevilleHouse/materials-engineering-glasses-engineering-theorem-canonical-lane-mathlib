import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean

structure GlassesKineticsPackage where
  glassTransitionTemperature : Prop
  viscosityModel : Prop
  relaxationTime : Prop
  fictiveTemperature : Prop

structure GlassesKineticsEvidence (G : GlassesKineticsPackage) where
  glassTransitionTemperatureClosed : G.glassTransitionTemperature
  viscosityModelClosed : G.viscosityModel
  relaxationTimeClosed : G.relaxationTime
  fictiveTemperatureClosed : G.fictiveTemperature

def GlassesKineticsClosed (G : GlassesKineticsPackage) : Prop :=
  G.glassTransitionTemperature ∧ G.viscosityModel ∧ G.relaxationTime ∧ G.fictiveTemperature

theorem glasses_kinetics_closed_from_evidence (G : GlassesKineticsPackage) (E : GlassesKineticsEvidence G) : GlassesKineticsClosed G := by
  exact And.intro E.glassTransitionTemperatureClosed (And.intro E.viscosityModelClosed (And.intro E.relaxationTimeClosed E.fictiveTemperatureClosed))

end MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean
end HautevilleHouse