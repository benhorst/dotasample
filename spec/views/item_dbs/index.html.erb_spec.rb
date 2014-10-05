require 'rails_helper'

RSpec.describe "item_dbs/index", :type => :view do
  before(:each) do
    assign(:item_dbs, [
      ItemDb.create!(
        :data => "Data",
        :patch_version => "Patch Version",
        :fetch_version => 1
      ),
      ItemDb.create!(
        :data => "Data",
        :patch_version => "Patch Version",
        :fetch_version => 1
      )
    ])
  end

  it "renders a list of item_dbs" do
    render
    assert_select "tr>td", :text => "Data".to_s, :count => 2
    assert_select "tr>td", :text => "Patch Version".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
