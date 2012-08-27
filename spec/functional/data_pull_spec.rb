require 'spec_helper'
include DroneAttacksHelper
include BundleDataPuller

describe "Data Pull and persist into db" do

  describe "DataHelper" do
    before(:each) do
      @droneAttackHelper = DataHelper.new
    end

    it "pull_data should pull data from api" do
      @multiData = @droneAttackHelper.pull_data(getUrl)

      @multiData.should_not be_empty
    end

    it "has to hit the url and refresh db with first 20 values from there" do
      data = @droneAttackHelper.pull_data(getUrl(1,0,5))

      @droneAttackHelper.refresh_db(data)

      DroneAttack.count.should  == 5
      ReferenceLink.count.should > 4
      Publisher.count.should > 4

      drone_attack = DroneAttack.first

      drone_attack.reference_links[0]
      drone_attack.reference_links[0].publisher.should_not be_nil
    end
    #it "should refresh database with all drone attacks" do
    #  initData = @dataHelper.pull_data(getUrl(1,0,1))
    #  total_attacks = initData["totalCount"]
    #  data = @dataHelper.pull_data(getUrl(1,0,total_attacks))
    #  @dataHelper.refresh_db(data)
    #
    #  DroneAttack.count.should == total_attacks
    #end
  end
end

