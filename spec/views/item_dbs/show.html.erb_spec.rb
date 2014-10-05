require 'rails_helper'

RSpec.describe "item_dbs/show", :type => :view do
  before(:each) do
    @item_db = assign(:item_db, ItemDb.create!(
      :data => "Data",
      :patch_version => "Patch Version",
      :fetch_version => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Data/)
    expect(rendered).to match(/Patch Version/)
    expect(rendered).to match(/1/)
  end
end
