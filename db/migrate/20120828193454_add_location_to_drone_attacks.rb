class AddLocationToDroneAttacks < ActiveRecord::Migration
  def change
    add_column :drone_attacks, :location_id, :integer
  end
end
