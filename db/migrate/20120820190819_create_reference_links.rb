  class CreateReferenceLinks < ActiveRecord::Migration
  def change
    create_table :reference_links do |t|
      t.text :url

      t.timestamps
    end
    #add_index :reference_links, :publisher_id
  end
end
