class CreateLocationGroups < ActiveRecord::Migration
  def change
    create_table :location_groups do |t|
      t.string :name
      t.integer :xcoordinate
      t.integer :ycoordinate

      t.timestamps
    end
  end
end
