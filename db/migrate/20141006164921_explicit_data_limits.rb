class ExplicitDataLimits < ActiveRecord::Migration
  def up
    change_column(:item_dbs, :data, :text, limit:16777216)
    change_column(:hero_dbs, :data, :text, limit:16777216)
  end
  def down
    change_column(:item_dbs, :data, :text, limit:nil)
    change_column(:hero_dbs, :data, :string, limit:nil)
  end

end
