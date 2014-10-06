class ItemDbDataToText < ActiveRecord::Migration
  def up
    change_table :item_dbs do |t|
      t.change :data, :text
    end
  end

  def down
    change_table :item_dbs do |t|
      t.change :data, :string
    end
  end
end
