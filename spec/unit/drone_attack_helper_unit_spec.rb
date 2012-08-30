require 'spec_helper'
include DroneAttacksHelper
include BundleDataPuller

describe "Drone Attack Helper" do
  before(:each) do
    @droneAttackHelper = DroneAttackHelper.new
    single_data = open(Rails.root.to_s + "/TestData/SingleRowData.json", &:read)
    single_parsed_data = JSON.parse(single_data)
    @attackData= single_parsed_data["data"][0]
    @rowData = single_parsed_data["data"][0]["refrences"][0]
  end

  it "create_publishers should create publisher from jsonData" do
    publisher = @droneAttackHelper.create_publisher(@rowData)

    publisher.name.should == "MSN"
  end

  it "create_reference_link should create referenceLink" do
    reference_link = @droneAttackHelper.create_reference_link(@rowData)

    reference_link.url.should == "http://www.msnbc.msn.com/id/7847008/"
    reference_link.publisher.name == "MSN"
  end

  it "create_drone_attack should create drone attack" do
    drone_attack = @droneAttackHelper.create_drone_attack(@attackData)
    drone_attack.incident_year.should == 2005
    drone_attack.location.information.should == "Mir Ali (Near Afghan Border)"
    drone_attack.location.province.should == "fata"
    drone_attack.location.city.should == "north_waziristan"
    drone_attack.al_qaida_min.should == nil
    drone_attack.al_qaida_max.should == 1
    drone_attack.taliban_min.should == nil
    drone_attack.taliban_max.should == nil
    drone_attack.civilians_min.should == 0
    drone_attack.civilians_max.should == 1
    drone_attack.forigeners_min.should == nil
    drone_attack.forigeners_max.should == nil
    drone_attack.total_died_min.should == nil
    drone_attack.total_died_max.should == 2
    drone_attack.injured_min.should == nil
    drone_attack.injured_max.should == nil
    drone_attack.women.should == false
    drone_attack.reference_links[0].publisher.name.should == "MSN"
    drone_attack.reference_links[0].url.should  == "http://www.msnbc.msn.com/id/7847008/"
    drone_attack.incident_date.should == 1115492400
    drone_attack.display_date.strftime("%m/%d/%Y").should == "05\/08\/2005"
    puts drone_attack.location
    drone_attack.location.location_group.xcoordinate.should_not be_nil
    drone_attack.location.location_group.ycoordinate.should_not be_nil
  end
end