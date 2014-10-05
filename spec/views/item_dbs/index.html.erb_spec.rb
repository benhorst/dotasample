require 'rails_helper'

RSpec.describe "item_dbs/index", :type => :view do
  before(:each) do
    assign(:item_dbs, [
      ItemDb.create!(
        :data => File.read("res/item_db_cache.json"),
        :patch_version => "Patch Version Uno",
        :fetch_version => 1
      ),
      ItemDb.create!(
        :data => File.read("res/item_db_cache.json"),
        :patch_version => "Patch Version Dos",
        :fetch_version => 2
      )
    ])
  end

  it "renders a list of item_dbs" do
    render
    assert_select "tr>td", :text => /Patch Version */, :count => 2
    assert_select "tr>td", :text => /^\d$/, :count => 2
  end
end
