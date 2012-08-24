require 'spec_helper'
include DroneAttacksHelper
include BundleDataPuller

describe "Drone Attack Helper" do
  before(:each) do
    @dataHelper = DataHelper.new
    single_data = open(Rails.root.to_s + "/TestData/SingleRowData.json", &:read)
    single_parsed_data = JSON.parse(single_data)
    @attackData= single_parsed_data["data"][0]
    @rowData = single_parsed_data["data"][0]["refrences"][0]
  end

  it "create_publishers should create publisher from jsonData" do
    publisher = @dataHelper.create_publisher(@rowData)

    publisher.name.should == "MSN"
  end

  it "create_reference_link should create referenceLink" do
    reference_link = @dataHelper.create_reference_link(@rowData)

    reference_link.url.should == "http://www.msnbc.msn.com/id/7847008/"
    reference_link.publisher.name == "MSN"
  end

  it "create_drone_attack should create drone attack" do
    drone_attack = @dataHelper.create_drone_attack(@attackData)
    drone_attack.incident_year.should == 2005
    drone_attack.location.should == "Mir Ali (Near Afghan Border)"
    drone_attack.province.should == "FATA"
    drone_attack.city.should == "North Waziristan"
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
    drone_attack.longitude.should == 69.8597406
    drone_attack.latitude.should == 32.3202371
    drone_attack.xcoordinate.should_not be_nil
    drone_attack.ycoordinate.should_not be_nil
  end
end