import MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean.PerelmanAnalyticProof

namespace HautevilleHouse
namespace MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean

structure CurvatureAnalyticEvidenceTerms {G : GlassesThermodynamicPackage}
    (C : CurvatureAnalyticCertificate G) where
  riemannTensorSymmetries : C.riemannTensorSymmetries
  bianchiIdentities : C.bianchiIdentities
  ricciContractionLaw : C.ricciContractionLaw
  scalarTraceLaw : C.scalarTraceLaw
  curvatureEvolutionInputs : C.curvatureEvolutionInputs
  curvatureClosed : GlassesThermodynamicClosed G

def CurvatureAnalyticCertificate.evidenceTerms {G : GlassesThermodynamicPackage}
    (C : CurvatureAnalyticCertificate G) : CurvatureAnalyticEvidenceTerms C :=
  {
    riemannTensorSymmetries := C.riemannTensorSymmetriesClosed
    bianchiIdentities := C.bianchiIdentitiesClosed
    ricciContractionLaw := C.ricciContractionLawClosed
    scalarTraceLaw := C.scalarTraceLawClosed
    curvatureEvolutionInputs := C.curvatureEvolutionInputsClosed
    curvatureClosed := glasses_thermodynamic_closed_from_evidence G C.curvatureEvidence
  }

end MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean
end HautevilleHouse