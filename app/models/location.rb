class Location < ActiveRecord::Base
  attr_accessible :city, :province, :xcoordinate, :ycoordinate, :information
  has_many :drone_attacks
end
