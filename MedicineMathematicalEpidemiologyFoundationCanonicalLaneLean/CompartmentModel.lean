import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMathematicalEpidemiologyFoundationCanonicalLaneLean

structure CompartmentModel where
  susceptible : Type u
  infected : Type v
  recovered : Type w
  sToI : susceptible → infected
  iToR : infected → recovered
  transmissionRate : ℝ
  recoveryRate : ℝ
  modelConsistent : Prop

structure CompartmentModelEvidence (C : CompartmentModel) where
  transmissionRatePositive : C.transmissionRate > 0
  recoveryRatePositive : C.recoveryRate > 0
  modelConsistentClosed : C.modelConsistent

def CompartmentModelClosed (C : CompartmentModel) : Prop :=
  C.transmissionRate > 0 ∧ C.recoveryRate > 0 ∧ C.modelConsistent

theorem compartment_model_closed_from_evidence
    (C : CompartmentModel) (E : CompartmentModelEvidence C) :
    CompartmentModelClosed C := by
  exact And.intro E.transmissionRatePositive
    (And.intro E.recoveryRatePositive E.modelConsistentClosed)

end MedicineMathematicalEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse