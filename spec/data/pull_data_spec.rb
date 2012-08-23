require 'spec_helper'
include DroneAttacksHelper
include BundleDataPuller

describe "DroneAttacksHelper" do

  describe "DataHelper" do
    before(:each) do
      @dataHelper = DataHelper.new
    end

    it "should refresh database with 300 drone attacks with only 50 per page" do
      data = @dataHelper.pull_data(getUrl(1,0,500))
      @dataHelper.refresh_db(data)
    end
  end
end
