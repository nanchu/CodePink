object @drone_attack
attributes :al_qaida_max, :al_qaida_min, :civilians_max, :civilians_min, :display_date, :forigeners_max, :forigeners_min, :incident_date, :incident_year, :injured_max, :injured_min, :taliban_max, :taliban_min, :total_died_max, :total_died_min, :women, :reference_links

glue :location do
  attributes :city => :city, :province => :province, :xcoordinate => :xcoordinate, :ycoordinate => :ycoordinate
end

child :reference_links do
  attributes :url
  child :publisher do
    attributes :name
  end
end