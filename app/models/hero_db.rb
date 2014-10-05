require 'json'
require 'json_validator'

class HeroDb < ActiveRecord::Base
  attr_reader :data, :patch_version, :fetch_version
  validates_with JsonParse, fields: [:data]
  validates_each :data, :patch_version do |record, attr, value|
    record.errors.add(attr, "cannot be empty or whitespace") if value.nil? || value.strip == ""
  end

  before_save do |herodb|
    # get last entry with that patch. next entry should increment fetch version
    same_patch = ItemDb.where(:patch_version => patch_version).last
    if same_patch.nil?
      herodb.fetch_version = 0
    else  
      herodb.fetch_version = same_patch.fetch_version + 1
    end   
  end   

  def data_hash
    @hash = JSON.parse(data)["itemdata"].to_hash if @hash.nil?
    @hash
  end
end
