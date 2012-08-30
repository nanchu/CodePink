class Location < ActiveRecord::Base
  attr_accessible :city, :province, :xcoordinate, :ycoordinate, :information, :location_group, :location_group_id, :location_group_attributes
  has_many :drone_attacks
  belongs_to :location_group
  accepts_nested_attributes_for :location_group
end
