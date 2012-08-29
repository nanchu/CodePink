require 'spec_helper'
include DroneAttacksHelper

url = "http://pakistanbodycount.org/functions.php?action=droneattacks&_dc=1343791499405&page=1&start=0&limit=50&sort=display_date&dir=ASC"


describe DroneAttacksHelper do
  describe "DataPuller" do
    it "should pull data from api" do
      dataPuller = DroneAttackHelper.new
      data = dataPuller.pull_data(url)

      data.should_not be_empty?
    end
  end
end
