require 'json'
require 'json_validator'
require 'net/http'

class ItemDb < ActiveRecord::Base

  validates_with JsonParse, fields: [:data]
  validates_each :data, :patch_version do |record, attr, value|
    record.errors.add(attr, "cannot be empty or whitespace") if value.nil? || value.strip == ""
  end

  before_save do |itemdb|
    # get last entry with that patch. next entry should increment fetch version
    same_patch = ItemDb.where(:patch_version => patch_version).last
    if same_patch.nil?
      itemdb.fetch_version = 0
    else
      itemdb.fetch_version = same_patch.fetch_version + 1
    end
  end

  def data_hash
    @hash = JSON.parse(data)["itemdata"].to_hash if @hash.nil?
    @hash
  end

  def self.get_dota2_items
    res = Net::HTTP.get('www.dota2.com', '/jsfeed/heropediadata?feeds=itemdata&v=2428987nfobKeI_Qh4k&l=english&callback=HeropediaDFReceive')
    match = res.match /^\w*?\((.*)\);$/
    match[1]
  end
end
