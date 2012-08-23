  class AddYcoordinateToDroneAttack < ActiveRecord::Migration
  def change
    add_column :drone_attacks, :ycoordinate, :integer
  end
end
