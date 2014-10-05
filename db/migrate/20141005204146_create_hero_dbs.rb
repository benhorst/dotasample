class CreateHeroDbs < ActiveRecord::Migration
  def change
    create_table :hero_dbs do |t|
      t.string :data
      t.string :patch_version
      t.integer :fetch_version

      t.timestamps
    end
  end
end
