import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMathematicalEpidemiologyFoundationCanonicalLaneLean

structure EnvironmentalTransmission where
  pathogenDecayRate : ℝ
  environmentalContactRate : ℝ
  infectiousDose : ℝ
  modelConsistent : Prop

structure EnvironmentalTransmissionEvidence (E : EnvironmentalTransmission) where
  decayRatePositive : E.pathogenDecayRate > 0
  contactRateNonnegative : E.environmentalContactRate ≥ 0
  infectiousDosePositive : E.infectiousDose > 0
  modelConsistentClosed : E.modelConsistent

def EnvironmentalTransmissionClosed (E : EnvironmentalTransmission) : Prop :=
  E.pathogenDecayRate > 0 ∧ E.environmentalContactRate ≥ 0 ∧
  E.infectiousDose > 0 ∧ E.modelConsistent

theorem environmental_transmission_closed_from_evidence
    (E : EnvironmentalTransmission) (Ev : EnvironmentalTransmissionEvidence E) :
    EnvironmentalTransmissionClosed E := by
  exact And.intro Ev.decayRatePositive
    (And.intro Ev.contactRateNonnegative
      (And.intro Ev.infectiousDosePositive Ev.modelConsistentClosed))

end MedicineMathematicalEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse