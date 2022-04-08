require 'test_helper'

class IncidentTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save empty incident type" do
    itype = IncidentType.new
    assert_not itype.save, "Saved an empty incident type"
  end

  test "should not save non-unique incident type" do
    itype = IncidentType.new(name: "CloggedToilet", default_severity: 2)
    itype2 = IncidentType.new(name: "CloggedToilet", default_severity: 2)
    itype.save
    assert_not itype2.save, "Saved a not uniquely named incident type"
  end
  
  # max default severity as of February 25, 2016
  test "should not save incident type with default severity > 10" do
    itype = IncidentType.new(name: "SomeIncident", default_severity: 100)
    assert_not itype.save, "Saved an incident type w/ default severity < max (which is 10)"
  end
  
  # min default severity as of February 25, 2016
  test "should not save incident type with default severity < 1" do
    itype = IncidentType.new(name: "SomeIncident", default_severity: 0)
    assert_not itype.save, "Saved an incident type w/ default severity < min (which is 1)"
  end

end
