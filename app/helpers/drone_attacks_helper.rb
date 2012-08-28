require 'httparty'
require 'json'
require 'geokit'

include GeoKit::Geocoders

module DroneAttacksHelper
  class DroneAttackHelper



    def create_drone_attack(attackData)
      droneAttack = DroneAttack.new

      droneAttack.incident_year= attackData["incident_year"]

      province =  update_name(attackData["province"].downcase)
      city = update_name(attackData["city"].downcase)
      information = attackData["location"]
      reference_location = Location.where(:city => city, :province => province).first
      if reference_location.nil?
        location = create_location(city, province, information)
        droneAttack.location= location
      else
        droneAttack.location= reference_location
      end
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

      return droneAttack
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

    def create_location(city, province, information)
      xcoordinate = Random.rand(0...500)
      ycoordinate = Random.rand(0...500)
      location = Location.create(:city => city, :province => province, :xcoordinate => xcoordinate, :ycoordinate => ycoordinate, :information => information)
      return location
    end

    def update_name(name)
      name.downcase
      name.gsub(" ", "_")
    end
  end
end
