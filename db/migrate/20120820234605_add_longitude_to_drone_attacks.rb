class AddLongitudeToDroneAttacks < ActiveRecord::Migration
  def change
    add_column :drone_attacks, :longitude, :float
  end
end
