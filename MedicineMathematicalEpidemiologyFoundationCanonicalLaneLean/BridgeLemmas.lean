import MedicineMathematicalEpidemiologyFoundationCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace MedicineMathematicalEpidemiologyFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  EpidemiologyWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A :=
  A.object.conclusion

end MedicineMathematicalEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse
