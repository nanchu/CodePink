class CreateDroneAttacks < ActiveRecord::Migration
  def change
    create_table :drone_attacks do |t|
      t.integer :incident_year
      t.string :location
      t.string :province
      t.string :city
      t.integer :al_qaida_min
      t.integer :al_qaida_max
      t.integer :taliban_min
      t.integer :taliban_max
      t.integer :civilians_min
      t.integer :civilians_max
      t.integer :forigeners_min
      t.integer :forigeners_max
      t.integer :total_died_min
      t.integer :total_died_max
      t.integer :injured_min
      t.integer :injured_max
      t.boolean :women
      t.integer :incident_date
      t.datetime :display_date

      t.timestamps
    end
    #add_index :drone_attacks, :reference_link_id
  end
end
