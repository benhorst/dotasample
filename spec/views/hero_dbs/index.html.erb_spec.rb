require 'rails_helper'

RSpec.describe "hero_dbs/index", :type => :view do
  before(:each) do
    assign(:hero_dbs, [
      HeroDb.create!(
        :data => "Data",
        :patch_version => "Patch Version",
        :fetch_version => 1
      ),
      HeroDb.create!(
        :data => "Data",
        :patch_version => "Patch Version",
        :fetch_version => 1
      )
    ])
  end

  it "renders a list of hero_dbs" do
    render
    assert_select "tr>td", :text => "Data".to_s, :count => 2
    assert_select "tr>td", :text => "Patch Version".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
