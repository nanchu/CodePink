class RemoveXcoordinateFromLocations < ActiveRecord::Migration
  def up
    remove_column :locations, :xcoordinate
  end

  def down
    add_column :locations, :xcoordinate, :integer
  end
end
