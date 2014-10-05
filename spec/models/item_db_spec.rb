require 'rails_helper'
require 'spec_helper'

RSpec.describe ItemDb, :type => :model do
  before do
    @itemdb = ItemDb.new(File.read("./res/item_db_cache.json"), "6.82")
  end

  it { should respond_to(:data) }
  it { should be_valid }

  describe "when data is not present" do
    before { @itemdb.data = " " }
    it { should_not be_valid }
  end

  describe "when patch_version is not present" do
    before { @itemdb.patch_version = " " }
    it { should_not be_valid }
  end

  describe "when patch+fetch is not unique" do
    before do
      same_item_patch = @itemdb.dup
      same_item_patch.save
    end
    it { should_not be_valid }
  end
end
