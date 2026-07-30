import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMathematicalEpidemiologyFoundationCanonicalLaneLean

structure DiagnosticTest (TestRes : Type) where
  sensitivity : Float
  specificity : Float
  prevalence : Float
  positivePredictiveValue : Float
  negativePredictiveValue : Float
  likelihoodRatioPositive : Float
  likelihoodRatioNegative : Float
  bayesianInferenceValid : Prop
  likelihoodRatioPositiveAboveOne : likelihoodRatioPositive > 1.0

structure DiagnosticInferenceEvidence (DT : DiagnosticTest TestResult) where
  bayesianInferenceValidClosed : DT.bayesianInferenceValid
  likelihoodRatioPositiveAboveOneClosed : DT.likelihoodRatioPositiveAboveOne

def DiagnosticInferenceClosed (DT : DiagnosticTest TestResult) : Prop :=
  DT.bayesianInferenceValid ∧ DT.likelihoodRatioPositiveAboveOne

theorem diagnostic_inference_closed_from_evidence
    (DT : DiagnosticTest TestResult) (E : DiagnosticInferenceEvidence DT) :
    DiagnosticInferenceClosed DT := by
  exact And.intro E.bayesianInferenceValidClosed E.likelihoodRatioPositiveAboveOneClosed

end MedicineMathematicalEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse