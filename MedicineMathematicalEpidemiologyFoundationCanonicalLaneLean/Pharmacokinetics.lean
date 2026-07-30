import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMathematicalEpidemiologyFoundation

structure PharmacokineticsPackage (P : AdmissibleClass) where
  drugConcentration : Type u
  absorptionRate : Prop
  eliminationRate : Prop
  volumeOfDistribution : Prop
  therapeuticWindow : Prop

structure PharmacokineticsEvidence (P : AdmissibleClass) (K : PharmacokineticsPackage P) where
  absorptionRateClosed : K.absorptionRate
  eliminationRateClosed : K.eliminationRate
  volumeOfDistributionClosed : K.volumeOfDistribution
  therapeuticWindowClosed : K.therapeuticWindow

def PharmacokineticsClosed (P : AdmissibleClass) (K : PharmacokineticsPackage P) : Prop :=
  K.absorptionRate ∧ K.eliminationRate ∧ K.volumeOfDistribution ∧ K.therapeuticWindow

theorem pharmacokinetics_closed_from_evidence (P : AdmissibleClass) (K : PharmacokineticsPackage P)
    (E : PharmacokineticsEvidence P K) : PharmacokineticsClosed P K := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.eliminationRateClosed
      (And.intro E.volumeOfDistributionClosed E.therapeuticWindowClosed))

end MedicineMathematicalEpidemiologyFoundation
end HautevilleHouse