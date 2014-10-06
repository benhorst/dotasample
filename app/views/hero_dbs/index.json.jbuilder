json.array!(@hero_dbs) do |hero_db|
  json.extract! hero_db, :id, :data, :patch_version, :fetch_version
  json.url hero_db_url(hero_db, format: :json)
end
