import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMathematicalEpidemiologyFoundationCanonicalLaneLean

structure HealthcareCapacity where
  totalBeds : ℕ
  icuBeds : ℕ
  dailyAdmissionRate : ℝ
  averageLengthOfStay : ℝ
  modelConsistent : Prop

structure HealthcareCapacityEvidence (H : HealthcareCapacity) where
  totalBedsPositive : H.totalBeds > 0
  icuBedsPositive : H.icuBeds > 0
  admissionRateNonnegative : H.dailyAdmissionRate ≥ 0
  lengthOfStayPositive : H.averageLengthOfStay > 0
  modelConsistentClosed : H.modelConsistent

def HealthcareCapacityClosed (H : HealthcareCapacity) : Prop :=
  H.totalBeds > 0 ∧ H.icuBeds > 0 ∧
  H.dailyAdmissionRate ≥ 0 ∧ H.averageLengthOfStay > 0 ∧ H.modelConsistent

theorem healthcare_capacity_closed_from_evidence
    (H : HealthcareCapacity) (E : HealthcareCapacityEvidence H) :
    HealthcareCapacityClosed H := by
  exact And.intro E.totalBedsPositive
    (And.intro E.icuBedsPositive
      (And.intro E.admissionRateNonnegative
        (And.intro E.lengthOfStayPositive E.modelConsistentClosed)))

def bedOccupancy (H : HealthcareCapacity) (t : ℝ) : ℝ :=
  H.dailyAdmissionRate * H.averageLengthOfStay

end MedicineMathematicalEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse