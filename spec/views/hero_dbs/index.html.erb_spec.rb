require 'rails_helper'

RSpec.describe "hero_dbs/index", :type => :view do
  before(:each) do
    assign(:hero_dbs, [
      HeroDb.create!(
        :data => File.read("res/hero_db_cache.json"),
        :patch_version => "Patch Version Alpha",
        :fetch_version => 6
      ),
      HeroDb.create!(
        :data => File.read("res/hero_db_cache.json"),
        :patch_version => "Patch Version Beta",
        :fetch_version => 1
      )
    ])
  end

  it "renders a list of hero_dbs" do
    render
    assert_select "tr>td", :text => /Patch Version */, :count => 2
    assert_select "tr>td", :text => /^\d$/, :count => 2
  end
end
