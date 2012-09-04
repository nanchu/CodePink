require  Rails.root.to_s + "/app/helpers/bundle_data_puller.rb"
include BundleDataPuller

task :updatedb => :environment do
  dataHelper = DataHelper.new
  dataHelper.update_db
end