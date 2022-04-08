require 'test_helper'

class IncidentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    test "should not save empty incident" do
        incident = Incident.new
        assert_not incident.save, "Saved an empty incident"
    end
    
    test "should not save incident without severity" do
        incident = Incident.new(location: "Halligan", 
                                start_date: "2016-02-08 00:35:03", 
                                incident_type_id: 1, 
                                name: "Joseph")
        assert_not incident.save, "Saved an incident without a severity"
    end
    
    # min as of February 25, 2016
    test "should not save incident with a severity below min (< 1)" do
        incident = Incident.new(location: "Halligan", 
                                start_date: "2016-02-08 00:35:03", 
                                incident_type_id: 1, 
                                severity: 0,
                                name: "Joseph")
        assert_not incident.save, "Saved an incident with a severity below the min of 1" 
    end
    
    # max as of February 25, 2016
    test "should not save incident with a severity above max (> 10)" do
        incident = Incident.new(location: "Halligan", 
                                start_date: "2016-02-08 00:35:03", 
                                incident_type_id: 1, 
                                severity: 9001, # over 9000!
                                name: "Joseph")
        assert_not incident.save, "Saved an incident with a severity above the max of 10"
    end

    test "should not save incident without location" do
        incident = Incident.new(start_date: "2016-02-08 00:35:03", 
                                incident_type_id: 1, 
                                severity: 5,  
                                name: "Joseph")
        assert_not incident.save, "Saved an incident without a location"
    end

    test "should not save incident without a start date" do
        incident = Incident.new(location: "Halligan", 
                                incident_type_id: 1, 
                                severity: 5,  
                                name: "Joseph")
        assert_not incident.save, "Saved an incident without a start date"
    end

    test "should not save incident without a name" do
        incident = Incident.new(location: "Halligan", 
                                start_date: "2016-02-08 00:35:03", 
                                incident_type_id: 101234, 
                                severity: 5)
        assert_not incident.save, "Saved an incident without a name"
    end
    
    test "should not save incident with a single character name" do
        incident = Incident.new(location: "Halligan", 
                                start_date: "2016-02-08 00:35:03", 
                                incident_type_id: 101234,
                                name: "A",
                                severity: 5)
        assert_not incident.save, "Saved an incident with a single char name"
    end
    
    test "should not save incident without an incident type id" do
        incident = Incident.new(location: "Halligan", 
                                start_date: "2016-02-08 00:35:03", 
                                name: "Joseph",
                                severity: 5)
        assert_not incident.save, "Saved an incident without a incident type id"
    end
    
    test "should not save incident with an invalid incident type id" do
        incident = Incident.new(location: "Halligan", 
                                start_date: "2016-02-08 00:35:03", 
                                incident_type_id: 101234, 
                                name: "Joseph",
                                severity: 5)
        assert_not incident.save, "Saved an incident with an invalid incident type id"
    end
end
