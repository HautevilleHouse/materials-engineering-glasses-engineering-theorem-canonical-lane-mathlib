import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean

structure GlassTransitionPackage where
  temperature : Type u
  viscosityModel : Prop
  fictiveTemperature : Prop
  configurationalEntropy : Prop
  relaxationTime : Prop
  fragilityIndex : Prop
  mixedAlkaliEffect : Prop

structure GlassTransitionEvidence (G : GlassTransitionPackage) where
  temperatureClosed : G.temperature
  viscosityModelClosed : G.viscosityModel
  fictiveTemperatureClosed : G.fictiveTemperature
  configurationalEntropyClosed : G.configurationalEntropy
  relaxationTimeClosed : G.relaxationTime
  fragilityIndexClosed : G.fragilityIndex
  mixedAlkaliEffectClosed : G.mixedAlkaliEffect

def GlassTransitionClosed (G : GlassTransitionPackage) : Prop :=
  G.temperature ∧ G.viscosityModel ∧ G.fictiveTemperature ∧
  G.configurationalEntropy ∧ G.relaxationTime ∧
  G.fragilityIndex ∧ G.mixedAlkaliEffect

theorem glass_transition_closed_from_evidence (G : GlassTransitionPackage)
    (E : GlassTransitionEvidence G) : GlassTransitionClosed G := by
  exact And.intro E.temperatureClosed
    (And.intro E.viscosityModelClosed
      (And.intro E.fictiveTemperatureClosed
        (And.intro E.configurationalEntropyClosed
          (And.intro E.relaxationTimeClosed
            (And.intro E.fragilityIndexClosed E.mixedAlkaliEffectClosed)))))

end MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
