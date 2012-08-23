require  Rails.root.to_s + "/app/helpers/drone_attacks_helper.rb"
include DroneAttacksHelper

task :refreshdb => :environment do
  dataHelper = DataHelper.new
  dataHelper.refresh_db1
end