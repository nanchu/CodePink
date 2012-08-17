class AddLocationDefinedToDroneAttacks < ActiveRecord::Migration
  def change
    add_column :drone_attacks, :location_defined, :boolean
  end
end
