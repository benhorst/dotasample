require 'rails_helper'

RSpec.describe "item_dbs/new", :type => :view do
  before(:each) do
    assign(:item_db, ItemDb.new(
      :data => "MyString",
      :patch_version => "MyString",
      :fetch_version => 1
    ))
  end

  it "renders new item_db form" do
    render

    assert_select "form[action=?][method=?]", item_dbs_path, "post" do

      assert_select "input#item_db_data[name=?]", "item_db[data]"

      assert_select "input#item_db_patch_version[name=?]", "item_db[patch_version]"

      assert_select "input#item_db_fetch_version[name=?]", "item_db[fetch_version]"
    end
  end
end
