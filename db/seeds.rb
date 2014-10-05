# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

dat = File.read("res/item_db_cache.json")
record = ItemDb.create(data: dat, patch_version: "6.82b")
record.save

dat = File.read("res/hero_db_cache.json")
record = HeroDb.new(data: dat, patch_version: "6.82b")
record.save

