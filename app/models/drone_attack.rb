require  Rails.root.to_s + "/app/helpers/drone_attacks_helper.rb"
include DroneAttacksHelper


class DroneAttack < ActiveRecord::Base

  attr_accessible :al_qaida_max, :al_qaida_min, :reference_links_attributes, :location_group_attributes, :publisher_id, :publishers_attributes, :city, :civilians_max, :civilians_min, :display_date, :forigeners_max, :forigeners_min, :incident_date, :incident_year, :injured_max, :injured_min, :location, :province, :taliban_max, :taliban_min, :total_died_max, :total_died_min, :women, :latitude, :longitude, :reference_links, :xcoordinate, :ycoordinate, :location_id, :location_group
  has_many :reference_links, :autosave => true
  has_many :publishers, :through => :reference_links
  belongs_to :location
  has_one :location_group, :through => :location

  accepts_nested_attributes_for :reference_links
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :publishers
  accepts_nested_attributes_for :location_group

  def refresh_db
    drone_attack = DroneAttacksHelper.new
    end
end

