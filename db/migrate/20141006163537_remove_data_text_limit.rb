class RemoveDataTextLimit < ActiveRecord::Migration
  def up
    change_column(:item_dbs, :data, :text, limit:nil)
    change_column(:hero_dbs, :data, :text, limit:nil)
  end
  def down
    change_column(:item_dbs, :data, :text, limit:255)
    change_column(:hero_dbs, :data, :string, limit:255)
  end
end
