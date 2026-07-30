import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMathematicalEpidemiologyFoundationCanonicalLaneLean

structure CompartmentModel (Pop : Type) where
  susceptible : Pop -> Prop
  exposed : Pop -> Prop
  infected : Pop -> Prop
  recovered : Pop -> Prop
  populationSize : Nat
  transmissionRate : Float
  recoveryRate : Float
  latencyRate : Float
  waningImmunityRate : Float
  diseaseFreeEquilibrium : Prop
  basicReproductiveNumber : Float
  basicReproductiveNumberAboveOne : basicReproductiveNumber > 1.0

structure CompartmentModelEvidence (CM : CompartmentModel PopulationType) where
  diseaseFreeEquilibriumClosed : CM.diseaseFreeEquilibrium
  basicReproductiveNumberAboveOneClosed : CM.basicReproductiveNumberAboveOne

def CompartmentModelClosed (CM : CompartmentModel PopulationType) : Prop :=
  CM.diseaseFreeEquilibrium ∧ CM.basicReproductiveNumberAboveOne

theorem compartment_model_closed_from_evidence
    (CM : CompartmentModel PopulationType) (E : CompartmentModelEvidence CM) :
    CompartmentModelClosed CM := by
  exact And.intro E.diseaseFreeEquilibriumClosed E.basicReproductiveNumberAboveOneClosed

end MedicineMathematicalEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse