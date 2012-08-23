require 'httparty'
require 'json'
require 'geokit'
include GeoKit::Geocoders

module DroneAttacksHelper
  class DataHelper

    def getUrl(pageNumber=1, start=0, limit=1)
      "http://pakistanbodycount.org/functions.php?action=droneattacks&_dc=1343791499405&page=" + pageNumber.to_s + "&start=" + start.to_s + "&limit=" + limit.to_s + "&sort=display_date&dir=ASC"
    end

    def refresh_db1
      data = pull_data(getUrl(1,0,9999))
      refresh_db(data)
    end

    def update_db()
      initData = pull_data(getUrl(1,0,1))
      number_attacks = initData["totalCount"]
      numberDrones = DroneAttack.count
      data = pull_data(getUrl(pageNumber=1, start=numberDrones, limit=number_attacks))

      i = 0

      while i < number_attacks.to_i
        row = data["data"][i]
        if row.nil?
          return
        end
        drone = create_drone_attack(row)
        drone.save
        i += 1
      end
    end

    def refresh_db(parsed_data)
      number_attacks = parsed_data["totalCount"]
      i = 0

      while i < number_attacks.to_i
        attackData = parsed_data["data"][i]
        if attackData.nil?
          return
        end
        droneAttack = create_drone_attack(attackData)
        droneAttack.save
        i +=1
      end
    end

    def pull_data(url)
      response = HTTParty.get(url)
      JSON.parse(response.body)
    end

    def create_publisher(raw_data)
      name = raw_data["name"]
      publisher = Publisher.create(:name => name)
      return publisher
    end

    def create_reference_link(raw_data)
      publisher = create_publisher(raw_data)
      rl = ReferenceLink.create(:url => raw_data["url"], :publisher => publisher)

      return rl
    end

    def create_drone_attack(attackData)
      droneAttack = DroneAttack.new

      droneAttack.incident_year= attackData["incident_year"]
      droneAttack.location= attackData["location"]

      province = droneAttack.province= attackData["province"]
      city = droneAttack.city= attackData["city"]
      geoLocation = province.to_s + " " + city.to_s

      coordinates = MultiGeocoder.geocode(geoLocation)
      droneAttack.latitude= coordinates.lat
      droneAttack.longitude= coordinates.lng

      droneAttack.al_qaida_min= attackData["al_qaida_min"]
      droneAttack.al_qaida_max= attackData["al_qaida_max"]
      droneAttack.taliban_min= attackData["taliban_min"]
      droneAttack.taliban_max= attackData["taliban_max"]
      droneAttack.civilians_min= attackData["civilians_min"]
      droneAttack.civilians_max= attackData["civilians_max"]
      droneAttack.forigeners_min= attackData["forigeners_min"]
      droneAttack.forigeners_max= attackData["forigeners_max"]
      droneAttack.total_died_min= attackData["total_died_min"]
      droneAttack.total_died_max= attackData["total_died_max"]
      droneAttack.injured_min= attackData["injured_min"]
      droneAttack.injured_max= attackData["injured_max"]
      droneAttack.women= attackData["women"]
      droneAttack.incident_date= attackData["incident_date"].to_i
      droneAttack.display_date= attackData["display_date"]
      references = attackData["refrences"]
      if !references.nil?
        references.each do |ref|
          ref_link = create_reference_link(ref)
          droneAttack.reference_links << ref_link
        end
      end
      droneAttack.xcoordinate= Random.rand(0...500)
      droneAttack.ycoordinate= Random.rand(0...500)
      return droneAttack
    end
  end
end
