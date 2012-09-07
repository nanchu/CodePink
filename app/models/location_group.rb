class LocationGroup < ActiveRecord::Base
  attr_accessible :name, :xcoordinate, :ycoordinate
  has_many :location, :autosave => true
end
