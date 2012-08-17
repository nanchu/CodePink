require 'spec_helper'
include DroneAttacksHelper

def getUrl(pageNumber=1, start=0, limit=1)
  "http://pakistanbodycount.org/functions.php?action=droneattacks&_dc=1343791499405&page=" + pageNumber.to_s + "&start=" + start.to_s + "&limit=" + limit.to_s + "&sort=display_date&dir=ASC"
end
url = "http://pakistanbodycount.org/functions.php?action=droneattacks&_dc=1343791499405&page=1&start=0&limit=50&sort=display_date&dir=ASC"

jsonData = "{""success""=>true, ""data""=>[{""incident_year""=>""2004"", ""location""=>""Near Wana"", ""province""=>""FATA"", ""city""=>""south Waziristan"", ""al_qaida_min""=>"""", ""al_qaida_max""=>"""", ""taliban_min""=>"""", ""taliban_max""=>""1"", ""civilians_min""=>""0"", ""civilians_max""=>""4"", ""forigeners_min""=>"""", ""forigeners_max""=>"""", ""total_died_min""=>"""", ""total_died_max""=>""5"", ""injured_min""=>"""", ""injured_max""=>"""", ""women""=>""N"", ""refrences""=>[{""name""=>""Dawn"", ""url""=>""http:\/\/archives.dawn.com\/2004\/06\/19\/top1.htm""}], ""incident_date""=>""1087498800"", ""display_date""=>""18/06/2004""}], ""totalCount""=>""309""}"


describe "DroneAttacksHelper" do

  describe "DataPuller" do

    it "should pull data from api" do
      dataPuller = DataPuller.new
      data = dataPuller.pull_data(getUrl())

      data.should_not be_empty
    end

    it "should parse and create drone attack object" do
      dataPuller = DataPuller.new
      droneAttack = DroneAttack.new

      data = dataPuller.pull_data(getUrl())
      droneAttack = dataPuller.create_drone_attack(data["data"][0])

      droneAttack.incident_year.should == 2004
      droneAttack.location.should == "Near Wana"
      droneAttack.province.should == "FATA"
      droneAttack.city.should == "south Waziristan"
      droneAttack.al_qaida_min.should == nil
      droneAttack.al_qaida_max.should == nil
      droneAttack.taliban_min.should == nil
      droneAttack.taliban_max.should == 1
      droneAttack.civilians_min.should == 0
      droneAttack.civilians_max.should == 4
      droneAttack.forigeners_min.should == nil
      droneAttack.forigeners_max.should == nil
      droneAttack.total_died_min.should == nil
      droneAttack.total_died_max.should == 5
      droneAttack.injured_min.should == nil
      droneAttack.injured_max.should == nil
      droneAttack.women.should == false
      droneAttack.url.should == "http://archives.dawn.com/2004/06/19/top1.htm"
      #droneAttack.incident_date.should equal 1087498800
      droneAttack.display_date.should == "18\/06\/2004"

    end

    it "should update database with 15 drone attacks" do
      dataPuller = DataPuller.new
      dataPuller.update_db(getUrl(1,0,15))

      DroneAttack.count.should == 15
    end

    #it "should update database with 300 drone attacks with only 50 per page" do
    #  dataPuller = DataPuller.new
    #  dataPuller.update_db(getUrl(1,0,300))
    #
    #  DroneAttack.count.should == 300
    #end
  end
end
