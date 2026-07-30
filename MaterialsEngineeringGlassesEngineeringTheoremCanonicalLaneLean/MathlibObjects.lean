import MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure GlassesMaterial where
  carrier : Type
  topology : TopologicalSpace carrier

structure GlassesAdmittedObject where
  material : GlassesMaterial
  amorphousPhaseDiagram : Prop
  glassTransitionTemperature : Prop
  structRelaxationModel : Type
  structRelaxTopology : TopologicalSpace structRelaxationModel
  structuralRelaxationComplete : Prop
  conclusion : structuralRelaxationComplete

structure GlassesEndgameState where
  object : GlassesAdmittedObject

def GlassesWitnessClosed (O : GlassesAdmittedObject) : Prop :=
  O.structuralRelaxationComplete

end MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean
end HautevilleHouse