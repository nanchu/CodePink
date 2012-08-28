object @drone_attack
attributes :al_qaida_max, :al_qaida_min, :city, :civilians_max, :civilians_min, :display_date, :forigeners_max, :forigeners_min, :incident_date, :incident_year, :injured_max, :injured_min, :location, :province, :taliban_max, :taliban_min, :total_died_max, :total_died_min, :women, :latitude, :longitude, :reference_links, :xcoordinate, :ycoordinate

child :reference_links do
  attributes :url
  child :publisher do
    attributes :name
  end
end