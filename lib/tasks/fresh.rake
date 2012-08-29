require  Rails.root.to_s + "/app/helpers/bundle_data_puller.rb"
include BundleDataPuller

task :fresh => :environment do
  dataHelper = DataHelper.new
  Rake::Task["db:drop"].invoke
  Rake::Task["db:create"].invoke
  Rake::Task["db:migrate"].invoke
  dataHelper.refresh_db1
end