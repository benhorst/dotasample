json.array!(@item_dbs) do |item_db|
  json.extract! item_db, :id, :data, :patch_version, :fetch_version
  json.url item_db_url(item_db, format: :json)
end
