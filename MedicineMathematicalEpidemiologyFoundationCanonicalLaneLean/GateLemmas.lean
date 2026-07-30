import MedicineMathematicalEpidemiologyFoundationCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace MedicineMathematicalEpidemiologyFoundationCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A :=
  A.gateWitness

end MedicineMathematicalEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse
