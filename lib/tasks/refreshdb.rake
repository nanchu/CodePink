require  Rails.root.to_s + "/app/helpers/bundle_data_puller.rb"
include BundleDataPuller

task :refreshdb => :environment do
  dataHelper = DataHelper.new
  dataHelper.refresh_db1
end