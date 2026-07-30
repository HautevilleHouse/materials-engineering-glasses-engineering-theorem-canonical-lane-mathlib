import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean

structure GlassFormingSystem where
  composition : Type u
  coolingRate : ℝ
  viscosityModel : Prop

struct ViscosityData where
  fragilityIndex : ℝ
  glassTransitionTemperature : ℝ
  angellPlot : Prop

struct StructuralRelaxation where
  relaxationTimeDistribution : Prop
  kwwExponent : ℝ
  nonExponentialFactor : ℝ

structure GlassesTransitionPackage (G : GlassFormingSystem) (V : ViscosityData) (R : StructuralRelaxation) where
  vogelFulcherTammannEquation : Prop
  williamsLandelFerryEquation : Prop
  adamGibbsTheory : Prop
  fictiveTemperatureConcept : Prop
  enthalpyRelaxationLandscape : Prop

structure GlassesTransitionEvidence {G : GlassFormingSystem} {V : ViscosityData} {R : StructuralRelaxation} (P : GlassesTransitionPackage G V R) where
  vogelFulcherTammannEquationClosed : P.vogelFulcherTammannEquation
  williamsLandelFerryEquationClosed : P.williamsLandelFerryEquation
  adamGibbsTheoryClosed : P.adamGibbsTheory
  fictiveTemperatureConceptClosed : P.fictiveTemperatureConcept
  enthalpyRelaxationLandscapeClosed : P.enthalpyRelaxationLandscape

def GlassesTransitionClosed {G : GlassFormingSystem} {V : ViscosityData} {R : StructuralRelaxation} (P : GlassesTransitionPackage G V R) : Prop :=
  P.vogelFulcherTammannEquation ∧ P.williamsLandelFerryEquation ∧ P.adamGibbsTheory ∧ P.fictiveTemperatureConcept ∧ P.enthalpyRelaxationLandscape

theorem glasses_transition_closed_from_evidence {G : GlassFormingSystem} {V : ViscosityData} {R : StructuralRelaxation} (P : GlassesTransitionPackage G V R) (E : GlassesTransitionEvidence P) :
    GlassesTransitionClosed P := by
  exact And.intro E.vogelFulcherTammannEquationClosed
    (And.intro E.williamsLandelFerryEquationClosed
      (And.intro E.adamGibbsTheoryClosed
        (And.intro E.fictiveTemperatureConceptClosed E.enthalpyRelaxationLandscapeClosed)))

end MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean
end HautevilleHouse