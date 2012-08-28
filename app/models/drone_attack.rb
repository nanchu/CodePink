require  Rails.root.to_s + "/app/helpers/drone_attacks_helper.rb"
include DroneAttacksHelper


class DroneAttack < ActiveRecord::Base

  attr_accessible :al_qaida_max, :al_qaida_min, :city, :civilians_max, :civilians_min, :display_date, :forigeners_max, :forigeners_min, :incident_date, :incident_year, :injured_max, :injured_min, :location, :province, :taliban_max, :taliban_min, :total_died_max, :total_died_min, :women, :latitude, :longitude, :reference_links, :xcoordinate, :ycoordinate
  has_many :reference_links, :autosave => true
  belongs_to :location

  accepts_nested_attributes_for :reference_links

  def refresh_db
    drone_attack = DroneAttacksHelper.new
    end
end

