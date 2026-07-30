import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMathematicalEpidemiologyFoundationCanonicalLaneLean

structure PharmacokineticModel where
  drugConcentration : ℝ → ℝ
  absorptionRate : ℝ
  eliminationRate : ℝ
  volumeDistribution : ℝ
  initialDose : ℝ
  modelConsistent : Prop

structure PharmacokineticModelEvidence (P : PharmacokineticModel) where
  absorptionRatePositive : P.absorptionRate > 0
  eliminationRatePositive : P.eliminationRate > 0
  volumeDistributionPositive : P.volumeDistribution > 0
  initialDoseNonnegative : P.initialDose ≥ 0
  modelConsistentClosed : P.modelConsistent

def PharmacokineticModelClosed (P : PharmacokineticModel) : Prop :=
  P.absorptionRate > 0 ∧ P.eliminationRate > 0 ∧
  P.volumeDistribution > 0 ∧ P.initialDose ≥ 0 ∧ P.modelConsistent

theorem pharmacokinetic_model_closed_from_evidence
    (P : PharmacokineticModel) (E : PharmacokineticModelEvidence P) :
    PharmacokineticModelClosed P := by
  exact And.intro E.absorptionRatePositive
    (And.intro E.eliminationRatePositive
      (And.intro E.volumeDistributionPositive
        (And.intro E.initialDoseNonnegative E.modelConsistentClosed)))

end MedicineMathematicalEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse