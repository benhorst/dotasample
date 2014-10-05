require 'rails_helper'

RSpec.describe "hero_dbs/show", :type => :view do
  before(:each) do
    @hero_db = assign(:hero_db, HeroDb.create!(
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
