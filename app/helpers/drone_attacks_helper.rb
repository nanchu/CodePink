require 'httparty'
require 'json'

module DroneAttacksHelper
  class DataPuller

    def update_db(url)
      data = pull_data(url)
      number_attacks = data["totalCount"]
      i = 0

      while i < number_attacks.to_i
        row = data["data"][i]
        if row.nil?
          return
        end
        @drone = create_drone_attack(row)
        @drone.save
        i += 1
        puts i
      end
    end

    def pull_data(url)
      response = HTTParty.get(url)
      JSON.parse(response.body)
    end

    def create_drone_attack(row)
      @droneAttack = DroneAttack.new
      @droneAttack.incident_year= row["incident_year"]
      @droneAttack.location= row["location"]
      @droneAttack.province= row["province"]
      @droneAttack.city= row["city"]
      @droneAttack.al_qaida_min= row["al_qaida_min"]
      @droneAttack.al_qaida_max= row["al_qaida_max"]
      @droneAttack.taliban_min= row["taliban_min"]
      @droneAttack.taliban_max= row["taliban_max"]
      @droneAttack.civilians_min= row["civilians_min"]
      @droneAttack.civilians_max= row["civilians_max"]
      @droneAttack.forigeners_min= row["forigeners_min"]
      @droneAttack.forigeners_max= row["forigeners_max"]
      @droneAttack.total_died_min= row["total_died_min"]
      @droneAttack.total_died_max= row["total_died_max"]
      @droneAttack.injured_min= row["injured_min"]
      @droneAttack.injured_max= row["injured_max"]
      @droneAttack.women= row["women"]
      @droneAttack.url= row["refrences"][0]["url"]
      @droneAttack.incident_date= row["incident_date"]
      @droneAttack.display_date= row["display_date"]

      return @droneAttack

    end
  end
end



      #puts incident_year
      #droneAttack.incident_year = incident_year.to_i

#sv1 = obj['KEY1']['SUB_KEY1']
