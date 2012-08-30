require  Rails.root.to_s + "/app/helpers/drone_attacks_helper.rb"
require 'rake'

include DroneAttacksHelper

module BundleDataPuller

  def getUrl(pageNumber=1, start=0, limit=1)
    "http://pakistanbodycount.org/functions.php?action=droneattacks&_dc=1343791499405&page=" + pageNumber.to_s + "&start=" + start.to_s + "&limit=" + limit.to_s + "&sort=display_date&dir=ASC"
  end

  class DataHelper



  def update_db()
    @droneAttackHelper = DroneAttackHelper.new
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
      drone = @droneAttackHelper.create_drone_attack_from_json(row)
      drone.save
      i += 1
    end
  end

  def refresh_db(parsed_data)
    @droneAttackHelper = DroneAttackHelper.new
    number_attacks = parsed_data["totalCount"]
    i = 0

    while i < number_attacks.to_i
      attackData = parsed_data["data"][i]
      if attackData.nil?
        return
      end
      droneAttack = @droneAttackHelper.create_drone_attack_from_json(attackData)
      droneAttack.save
      i +=1
    end
  end

  def pull_data(url)
    response = HTTParty.get(url)
    JSON.parse(response.body)
  end
  #What number of records do we have in the database
  def pullChunkOfData(startFrom=100)
    hundred = 50
    limit = startFrom % hundred * hundred
    puts limit

    pageNumber = startFrom % hundred
    puts pageNumber

    dataPuller = DroneAttackHelper.new

    while(!jsonData.nil?)
      url = getUrl(pageNumber, 0, limit)
      jsonData = dataPuller.pull_data(url)

      dataPuller.update_db(jsonData)
      pageNumber+=1
    end
  end

  def refresh_db1
    Rake::Task["db:reset"].execute
    data = pull_data(getUrl(1,0,9999))
    refresh_db(data)
  end

  end
end