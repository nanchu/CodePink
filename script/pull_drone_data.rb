require 'httparty'
require 'json'

class DroneDataSet
  def pull_data(url)
    response = HTTParty.get(link)
    JSON.parse(response.body)
  end
end

