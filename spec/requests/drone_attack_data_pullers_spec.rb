require 'spec_helper'
require './script/pull_drone_data'

url = "http://pakistanbodycount.org/functions.php?action=droneattacks&_dc=1343791499405&page=1&start=0&limit=2&sort=display_date&dir=ASC"

describe "DroneAttackDataPullers" do
    it "should get data from droid attack api" do
      dataSet = DroneDataSet.new
      data = dataSet.pull_data(url)

      data.should_not be.empty
    end
  end
