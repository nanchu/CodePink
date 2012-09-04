# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

location_groups = LocationGroup.create([{:name => 'Group1', :xcoordinate => 50, :ycoordinate => 50}])
user = User.create(:name => 'Admin', :email => 'admin@codepink.com', :password => 'password', :password_confirmation => 'password')
