require 'rails_helper'

RSpec.describe "ItemDbs", :type => :request do
  describe "GET /item_dbs" do
    it "works! (now write some real specs)" do
      get item_dbs_path
      expect(response).to have_http_status(200)
    end
  end
end
