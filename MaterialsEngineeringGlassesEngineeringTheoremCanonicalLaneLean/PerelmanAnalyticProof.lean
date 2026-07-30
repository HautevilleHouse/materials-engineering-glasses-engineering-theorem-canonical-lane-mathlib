import MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean.PerelmanRoute

namespace HautevilleHouse
namespace MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean

structure CurvatureAnalyticCertificate (G : GlassesThermodynamicPackage) where
  riemannTensorSymmetries : Prop
  bianchiIdentities : Prop
  ricciContractionLaw : Prop
  scalarTraceLaw : Prop
  curvatureEvolutionInputs : Prop
  riemannTensorSymmetriesClosed : riemannTensorSymmetries
  bianchiIdentitiesClosed : bianchiIdentities
  ricciContractionLawClosed : ricciContractionLaw
  scalarTraceLawClosed : scalarTraceLaw
  curvatureEvolutionInputsClosed : curvatureEvolutionInputs
  curvatureEvidence : GlassesThermodynamicEvidence G

def CurvatureAnalyticCertificateClosed {G : GlassesThermodynamicPackage}
    (C : CurvatureAnalyticCertificate G) : Prop :=
  C.riemannTensorSymmetries ∧
  C.bianchiIdentities ∧
  C.ricciContractionLaw ∧
  C.scalarTraceLaw ∧
  C.curvatureEvolutionInputs ∧
  GlassesThermodynamicClosed G

theorem curvature_analytic_certificate_closed
    {G : GlassesThermodynamicPackage} (C : CurvatureAnalyticCertificate G) :
    CurvatureAnalyticCertificateClosed C := by
  exact And.intro C.riemannTensorSymmetriesClosed
    (And.intro C.bianchiIdentitiesClosed
      (And.intro C.ricciContractionLawClosed
        (And.intro C.scalarTraceLawClosed
          (And.intro C.curvatureEvolutionInputsClosed
            (glasses_thermodynamic_closed_from_evidence G C.curvatureEvidence)))))

end MaterialsEngineeringGlassesEngineeringTheoremCanonicalLaneLean
end HautevilleHouse