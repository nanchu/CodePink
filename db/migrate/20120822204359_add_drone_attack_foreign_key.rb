class AddDroneAttackForeignKey < ActiveRecord::Migration
  def up
    add_column :reference_links, :drone_attack_id, :integer
    add_column :reference_links, :publisher_id, :integer
  end

  def down
    remove_column :reference_links, :drone_attack_id
    remove_column :reference_links, :publisher_id
  end
end
