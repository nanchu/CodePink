class AddXcoordinateToDroneAttack < ActiveRecord::Migration
  def change
    add_column :drone_attacks, :xcoordinate, :integer
  end
end
