class AddLocationForeignKeys < ActiveRecord::Migration
  def up
    add_column :locations, :location_group_id, :integer
  end

  def down
    remove_column :locations, :location_group_id
  end
end