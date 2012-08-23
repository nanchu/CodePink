require 'spec_helper'
include DroneAttacksHelper
include BundleDataPuller

describe "DroneAttacksHelper" do

  describe "DataHelper" do
    before(:each) do
      @dataHelper = DataHelper.new
      singleData = open(Rails.root.to_s + "/TestData/SingleRowData.json", &:read)
      @singleParsedData = JSON.parse(singleData)
      multiData = open(Rails.root.to_s + "/TestData/MultiRowData.json", &:read)
      @multiParsedData = JSON.parse(multiData)
    end

    it "pull_data should pull data from api" do
      @multiData = @dataHelper.pull_data(getUrl)
      @multiData.should_not be_empty
    end

    it "refresh_db should take single data and persist in db" do
      @dataHelper.refresh_db(@singleParsedData)

      DroneAttack.count.should == 1
      ReferenceLink.count.should == 1
      Publisher.count.should == 1
      drone_attack = DroneAttack.first

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
      drone_attack.reference_links.count.should == 1
      drone_attack.reference_links[0].publisher.name.should == "MSN"
      drone_attack.reference_links[0].url.should  == "http://www.msnbc.msn.com/id/7847008/"
      drone_attack.incident_date.should == 1115492400
      drone_attack.display_date.strftime("%m/%d/%Y").should == "05\/08\/2005"
      drone_attack.longitude.should == 69.8597406
      drone_attack.latitude.should == 32.3202371
    end

    it "refresh_db should should completely update db" do
      @dataHelper.refresh_db(@multiParsedData)

      DroneAttack.count.should > 15
      ReferenceLink.count.should > 15
      Publisher.count.should > 15
    end

    it "has to hit the url and update db with first 20 values from there" do
      data = @dataHelper.pull_data(getUrl(1,0,20))

      @dataHelper.refresh_db(data)

      DroneAttack.count.should  == 20
      ReferenceLink.count.should > 20
      Publisher.count.should > 20
      drone_attack = DroneAttack.first

      drone_attack.reference_links[0]
      drone_attack.reference_links[0].publisher.should_not be_nil
    end
    it "should refresh database with 300 drone attacks with only 50 per page" do
      data = @dataHelper.pull_data(getUrl(1,0,99))
      @dataHelper.refresh_db(data)

      DroneAttack.count.should == 99
    end

    #it "update_db should update db to " do
    #  @dataHelper.refresh_db(@singleParsedData)
    #  DroneAttack.count.should == 1
    #
    #  @dataHelper.update_db
    #
    #  DroneAttack.count.should == 309
    #end
  end
end
