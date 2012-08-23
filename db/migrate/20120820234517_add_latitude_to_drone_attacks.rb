class AddLatitudeToDroneAttacks < ActiveRecord::Migration
  def change
    add_column :drone_attacks, :latitude, :float
  end
end
