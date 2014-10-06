require 'rails_helper'

RSpec.describe "hero_dbs/new", :type => :view do
  before(:each) do
    assign(:hero_db, HeroDb.new(
      :data => "MyString",
      :patch_version => "MyString",
      :fetch_version => 1
    ))
  end

  it "renders new hero_db form" do
    render

    assert_select "form[action=?][method=?]", hero_dbs_path, "post" do

      assert_select "input#hero_db_data[name=?]", "hero_db[data]"

      assert_select "input#hero_db_patch_version[name=?]", "hero_db[patch_version]"

      assert_select "input#hero_db_fetch_version[name=?]", "hero_db[fetch_version]"
    end
  end
end
