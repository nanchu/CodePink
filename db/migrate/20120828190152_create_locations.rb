class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :city
      t.string :province
      t.string :information
      t.integer :xcoordinate
      t.integer :ycoordinate

      t.timestamps
    end
  end
end
