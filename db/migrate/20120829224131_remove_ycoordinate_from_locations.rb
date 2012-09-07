class RemoveYcoordinateFromLocations < ActiveRecord::Migration
  def up
    remove_column :locations, :ycoordinate
  end

  def down
    add_column :locations, :ycoordinate, :integer
  end
end
