require 'rails_helper'

RSpec.describe "HeroDbs", :type => :request do
  describe "GET /hero_dbs" do
    it "works! (now write some real specs)" do
      get hero_dbs_path
      expect(response).to have_http_status(200)
    end
  end
end
