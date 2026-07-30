import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean

structure CrystallographyPackage where
  latticeStructure : Type u
  unitCellVolume : Prop
  symmetryGroup : Type v
  bravaisLatticeType : Prop

structure CrystallographyEvidence (C : CrystallographyPackage) where
  latticeStructureClosed : C.latticeStructure
  unitCellVolumeClosed : C.unitCellVolume
  symmetryGroupClosed : C.symmetryGroup
  bravaisLatticeTypeClosed : C.bravaisLatticeType

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.latticeStructure ∧ C.unitCellVolume ∧ C.symmetryGroup ∧ C.bravaisLatticeType

theorem crystallography_closed_from_evidence (C : CrystallographyPackage) (E : CrystallographyEvidence C) : CrystallographyClosed C := by
  exact And.intro E.latticeStructureClosed (And.intro E.unitCellVolumeClosed (And.intro E.symmetryGroupClosed E.bravaisLatticeTypeClosed))

end MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean
end HautevilleHouse