import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMathematicalEpidemiologyFoundation

structure BasicReproductiveNumberPackage (P : AdmissibleClass) where
  R0 : Type u
  transmissionRate : Prop
  recoveryRate : Prop
  averageInfectiousPeriod : Prop
  populationSusceptibleFraction : Prop

structure BasicReproductiveNumberEvidence (P : AdmissibleClass) (R : BasicReproductiveNumberPackage P) where
  transmissionRateClosed : R.transmissionRate
  recoveryRateClosed : R.recoveryRate
  averageInfectiousPeriodClosed : R.averageInfectiousPeriod
  populationSusceptibleFractionClosed : R.populationSusceptibleFraction

def BasicReproductiveNumberClosed (P : AdmissibleClass) (R : BasicReproductiveNumberPackage P) : Prop :=
  R.transmissionRate ∧ R.recoveryRate ∧ R.averageInfectiousPeriod ∧ R.populationSusceptibleFraction

theorem basic_reproductive_number_closed_from_evidence (P : AdmissibleClass) (R : BasicReproductiveNumberPackage P)
    (E : BasicReproductiveNumberEvidence P R) : BasicReproductiveNumberClosed P R := by
  exact And.intro E.transmissionRateClosed
    (And.intro E.recoveryRateClosed
      (And.intro E.averageInfectiousPeriodClosed E.populationSusceptibleFractionClosed))

end MedicineMathematicalEpidemiologyFoundation
end HautevilleHouse