import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMathematicalEpidemiologyFoundation

structure EpidemiologicalEndpointPackage (P : AdmissibleClass) where
  diseaseFreeSurvival : Prop
  overallSurvival : Prop
  incidenceRate : Prop
  mortalityRate : Prop
  endpointMet : Prop

structure EpidemiologicalEndpointEvidence (P : AdmissibleClass) (E : EpidemiologicalEndpointPackage P) where
  diseaseFreeSurvivalClosed : E.diseaseFreeSurvival
  overallSurvivalClosed : E.overallSurvival
  incidenceRateClosed : E.incidenceRate
  mortalityRateClosed : E.mortalityRate
  endpointMetClosed : E.endpointMet

def EpidemiologicalEndpointClosed (P : AdmissibleClass) (E : EpidemiologicalEndpointPackage P) : Prop :=
  E.diseaseFreeSurvival ∧ E.overallSurvival ∧ E.incidenceRate ∧ E.mortalityRate ∧ E.endpointMet

theorem epidemiological_endpoint_closed_from_evidence (P : AdmissibleClass) (E : EpidemiologicalEndpointPackage P)
    (Ev : EpidemiologicalEndpointEvidence P E) : EpidemiologicalEndpointClosed P E := by
  exact And.intro Ev.diseaseFreeSurvivalClosed
    (And.intro Ev.overallSurvivalClosed
      (And.intro Ev.incidenceRateClosed
        (And.intro Ev.mortalityRateClosed Ev.endpointMetClosed)))

end MedicineMathematicalEpidemiologyFoundation
end HautevilleHouse