import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean

structure PhaseDiagramPackage where
  temperatureRange : Prop
  compositionRange : Prop
  phaseBoundaries : Prop
  gibbsFreeEnergy : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  temperatureRangeClosed : P.temperatureRange
  compositionRangeClosed : P.compositionRange
  phaseBoundariesClosed : P.phaseBoundaries
  gibbsFreeEnergyClosed : P.gibbsFreeEnergy

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.temperatureRange ∧ P.compositionRange ∧ P.phaseBoundaries ∧ P.gibbsFreeEnergy

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.temperatureRangeClosed (And.intro E.compositionRangeClosed (And.intro E.phaseBoundariesClosed E.gibbsFreeEnergyClosed))

end MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean
end HautevilleHouse