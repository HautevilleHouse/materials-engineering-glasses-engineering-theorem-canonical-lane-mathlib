import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean

structure PhaseDiagramPackage where
  components : Type u
  phases : Type v
  solidusLine : Prop
  liquidusLine : Prop
  eutecticPoint : Prop
  eutectoidPoint : Prop
  peritecticPoint : Prop
  glassTransitionRegion : Prop
  metastableZone : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  componentsClosed : P.components
  phasesClosed : P.phases
  solidusLineClosed : P.solidusLine
  liquidusLineClosed : P.liquidusLine
  eutecticPointClosed : P.eutecticPoint
  eutectoidPointClosed : P.eutectoidPoint
  peritecticPointClosed : P.peritecticPoint
  glassTransitionRegionClosed : P.glassTransitionRegion
  metastableZoneClosed : P.metastableZone

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.components ∧ P.phases ∧ P.solidusLine ∧ P.liquidusLine ∧
  P.eutecticPoint ∧ P.eutectoidPoint ∧ P.peritecticPoint ∧
  P.glassTransitionRegion ∧ P.metastableZone

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage)
    (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.componentsClosed
    (And.intro E.phasesClosed
      (And.intro E.solidusLineClosed
        (And.intro E.liquidusLineClosed
          (And.intro E.eutecticPointClosed
            (And.intro E.eutectoidPointClosed
              (And.intro E.peritecticPointClosed
                (And.intro E.glassTransitionRegionClosed E.metastableZoneClosed)))))))

end MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
