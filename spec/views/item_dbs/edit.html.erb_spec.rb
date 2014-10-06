require 'rails_helper'

RSpec.describe "item_dbs/edit", :type => :view do
  before(:each) do
    @item_db = assign(:item_db, ItemDb.create!(
      :data => File.read("res/item_db_cache.json"),
      :patch_version => "MyString",
      :fetch_version => 1
    ))
  end

  it "renders the edit item_db form" do
    render

    assert_select "form[action=?][method=?]", item_db_path(@item_db), "post" do

      assert_select "input#item_db_data[name=?]", "item_db[data]"

      assert_select "input#item_db_patch_version[name=?]", "item_db[patch_version]"

      assert_select "input#item_db_fetch_version[name=?]", "item_db[fetch_version]"
    end
  end
end
