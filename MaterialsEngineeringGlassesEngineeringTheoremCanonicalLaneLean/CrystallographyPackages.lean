import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean

structure CrystalSystem (M : Type u) where
  latticeStructure : Type v
  bravaisLattice : Prop
  siteOccupancy : Prop
  symmetryGroup : Prop

structure CrystallographyPackage (C : CrystalSystem) where
  unitCellGeometry : Prop
  reciprocalLattice : Prop
  structureFactorComputation : Prop
  millerIndices : Prop
  extinctionRules : Prop

structure CrystallographyEvidence {C : CrystalSystem} (P : CrystallographyPackage C) where
  unitCellGeometryClosed : P.unitCellGeometry
  reciprocalLatticeClosed : P.reciprocalLattice
  structureFactorComputationClosed : P.structureFactorComputation
  millerIndicesClosed : P.millerIndices
  extinctionRulesClosed : P.extinctionRules

def CrystallographyClosed {C : CrystalSystem} (P : CrystallographyPackage C) : Prop :=
  P.unitCellGeometry ∧ P.reciprocalLattice ∧ P.structureFactorComputation ∧ P.millerIndices ∧ P.extinctionRules

theorem crystallography_closed_from_evidence {C : CrystalSystem} (P : CrystallographyPackage C) (E : CrystallographyEvidence P) :
    CrystallographyClosed P := by
  exact And.intro E.unitCellGeometryClosed
    (And.intro E.reciprocalLatticeClosed
      (And.intro E.structureFactorComputationClosed
        (And.intro E.millerIndicesClosed E.extinctionRulesClosed)))

end MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean
end HautevilleHouse