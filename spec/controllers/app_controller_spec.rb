require 'rails_helper'

RSpec.describe AppController, :type => :controller do

  describe "GET items" do
    it "returns http success" do
      get :items
      expect(response).to have_http_status(:success)
    end
  end

end
