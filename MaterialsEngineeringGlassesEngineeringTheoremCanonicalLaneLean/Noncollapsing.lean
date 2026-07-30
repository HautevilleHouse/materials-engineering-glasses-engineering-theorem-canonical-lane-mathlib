import MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean.StructuralRelaxation

namespace HautevilleHouse
namespace MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean

structure NoncollapsingPackage {G : GlassesThermodynamicPackage}
    {F : ViscosityModelPackage G} (Epkg : StructuralRelaxationPackage F) where
  scaleInvariantVolumeBound : Prop
  curvatureScaleControl : Prop
  blowupLimitNoncollapsed : Prop

structure NoncollapsingEvidence {G : GlassesThermodynamicPackage}
    {F : ViscosityModelPackage G} {Epkg : StructuralRelaxationPackage F}
    (N : NoncollapsingPackage Epkg) where
  scaleInvariantVolumeBoundClosed : N.scaleInvariantVolumeBound
  curvatureScaleControlClosed : N.curvatureScaleControl
  blowupLimitNoncollapsedClosed : N.blowupLimitNoncollapsed

def NoncollapsingClosed {G : GlassesThermodynamicPackage}
    {F : ViscosityModelPackage G} {Epkg : StructuralRelaxationPackage F}
    (N : NoncollapsingPackage Epkg) : Prop :=
  N.scaleInvariantVolumeBound ∧ N.curvatureScaleControl ∧ N.blowupLimitNoncollapsed

theorem noncollapsing_closed_from_evidence
    {G : GlassesThermodynamicPackage} {F : ViscosityModelPackage G}
    {Epkg : StructuralRelaxationPackage F}
    (N : NoncollapsingPackage Epkg) (E : NoncollapsingEvidence N) :
    NoncollapsingClosed N := by
  exact And.intro E.scaleInvariantVolumeBoundClosed
    (And.intro E.curvatureScaleControlClosed E.blowupLimitNoncollapsedClosed)

end MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean
end HautevilleHouse