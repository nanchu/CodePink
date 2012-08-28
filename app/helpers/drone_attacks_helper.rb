require 'httparty'
require 'json'
require 'geokit'

include GeoKit::Geocoders

module DroneAttacksHelper
  class DroneAttackHelper

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
      #geoLocation = province.to_s + " " + city.to_s

      #coordinates = MultiGeocoder.geocode(geoLocation)
      #droneAttack.latitude= coordinates.lat
      #droneAttack.longitude= coordinates.lng

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
      if droneAttack.city == "North Waziristan"
        droneAttack.xcoordinate= 100
        droneAttack.ycoordinate= 400
      elsif droneAttack.city == "South Waziristan"
        droneAttack.xcoordinate=125
        droneAttack.ycoordinate=200
      elsif droneAttack.city == "Bajaur Agency"
        droneAttack.xcoordinate=350
        droneAttack.ycoordinate=285
      elsif
        droneAttack.city == "Bannu"
        droneAttack.xcoordinate=345
        droneAttack.ycoordinate=100
      elsif
      droneAttack.city == "Khyber"
        droneAttack.xcoordinate=305
        droneAttack.ycoordinate=199
      elsif
      droneAttack.city == "Kurram Agency"
        droneAttack.xcoordinate=45
        droneAttack.ycoordinate=371
      elsif
      droneAttack.city == "Khyber"
        droneAttack.xcoordinate=235
        droneAttack.ycoordinate=488
      elsif
      droneAttack.city == "Khyber Agency"
        droneAttack.xcoordinate=208
        droneAttack.ycoordinate=430
      else
        droneAttack.xcoordinate= Random.rand(0...500)
        droneAttack.ycoordinate= Random.rand(0...500)
      end
      return droneAttack
    end
  end
end
