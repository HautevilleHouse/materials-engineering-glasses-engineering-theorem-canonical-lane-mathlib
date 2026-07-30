import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean

structure ThermodynamicComponent where
  species : Type u
  molarFraction : ℝ
  chemicalPotential : ℝ

structure PhaseDiagramPackage (T : ThermodynamicComponent) where
  gibbsFreeEnergyModel : Prop
  phaseBoundaryCalculation : Prop
  eutecticPoint : Prop
  liquidusSolidusCurves : Prop
  metastableExtension : Prop

structure PhaseDiagramEvidence {T : ThermodynamicComponent} (P : PhaseDiagramPackage T) where
  gibbsFreeEnergyModelClosed : P.gibbsFreeEnergyModel
  phaseBoundaryCalculationClosed : P.phaseBoundaryCalculation
  eutecticPointClosed : P.eutecticPoint
  liquidusSolidusCurvesClosed : P.liquidusSolidusCurves
  metastableExtensionClosed : P.metastableExtension

def PhaseDiagramClosed {T : ThermodynamicComponent} (P : PhaseDiagramPackage T) : Prop :=
  P.gibbsFreeEnergyModel ∧ P.phaseBoundaryCalculation ∧ P.eutecticPoint ∧ P.liquidusSolidusCurves ∧ P.metastableExtension

theorem phase_diagram_closed_from_evidence {T : ThermodynamicComponent} (P : PhaseDiagramPackage T) (E : PhaseDiagramEvidence P) :
    PhaseDiagramClosed P := by
  exact And.intro E.gibbsFreeEnergyModelClosed
    (And.intro E.phaseBoundaryCalculationClosed
      (And.intro E.eutecticPointClosed
        (And.intro E.liquidusSolidusCurvesClosed E.metastableExtensionClosed)))

end MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean
end HautevilleHouse