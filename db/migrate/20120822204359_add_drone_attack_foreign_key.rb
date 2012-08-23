class AddDroneAttackForeignKey < ActiveRecord::Migration
  def up
    add_column :reference_links, :drone_attack_id, :integer
    add_column :publishers, :reference_link_id, :integer
  end

  def down
    remove_column :reference_links, :drone_attack_id
    remove_column :publishers, :reference_link_id
  end
end
