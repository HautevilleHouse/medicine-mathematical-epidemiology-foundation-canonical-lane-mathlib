import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMathematicalEpidemiologyFoundationCanonicalLaneLean

structure SurvivalModel (EventTime : Type) where
  hazardFunction : EventTime -> Float
  survivalFunction : EventTime -> Float
  cumulativeHazard : EventTime -> Float
  proportionalHazardsAssumption : Prop
  coxModelValid : Prop
  hazardRatioPositive : hazardFunction 0 > 0.0

structure SurvivalAnalysisEvidence (SM : SurvivalModel TimePoint) where
  proportionalHazardsAssumptionClosed : SM.proportionalHazardsAssumption
  coxModelValidClosed : SM.coxModelValid
  hazardRatioPositiveClosed : SM.hazardRatioPositive

def SurvivalAnalysisClosed (SM : SurvivalModel TimePoint) : Prop :=
  SM.proportionalHazardsAssumption ∧ SM.coxModelValid ∧ SM.hazardRatioPositive

theorem survival_analysis_closed_from_evidence
    (SM : SurvivalModel TimePoint) (E : SurvivalAnalysisEvidence SM) :
    SurvivalAnalysisClosed SM := by
  exact And.intro E.proportionalHazardsAssumptionClosed
    (And.intro E.coxModelValidClosed E.hazardRatioPositiveClosed)

end MedicineMathematicalEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse