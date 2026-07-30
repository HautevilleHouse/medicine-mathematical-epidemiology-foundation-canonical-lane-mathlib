import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMathematicalEpidemiologyFoundationCanonicalLaneLean

structure DiseaseProgression where
  incubationPeriod : ℝ
  infectiousPeriod : ℝ
  recoveryTime : ℝ
  modelConsistent : Prop

structure DiseaseProgressionEvidence (D : DiseaseProgression) where
  incubationPositive : D.incubationPeriod > 0
  infectiousPositive : D.infectiousPeriod > 0
  recoveryPositive : D.recoveryTime > 0
  modelConsistentClosed : D.modelConsistent

def DiseaseProgressionClosed (D : DiseaseProgression) : Prop :=
  D.incubationPeriod > 0 ∧ D.infectiousPeriod > 0 ∧
  D.recoveryTime > 0 ∧ D.modelConsistent

theorem disease_progression_closed_from_evidence
    (D : DiseaseProgression) (E : DiseaseProgressionEvidence D) :
    DiseaseProgressionClosed D := by
  exact And.intro E.incubationPositive
    (And.intro E.infectiousPositive
      (And.intro E.recoveryPositive E.modelConsistentClosed))

end MedicineMathematicalEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse