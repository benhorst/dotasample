require "rails_helper"

RSpec.describe ItemDbsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/item_dbs").to route_to("item_dbs#index")
    end

    it "routes to #new" do
      expect(:get => "/item_dbs/new").to route_to("item_dbs#new")
    end

    it "routes to #show" do
      expect(:get => "/item_dbs/1").to route_to("item_dbs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/item_dbs/1/edit").to route_to("item_dbs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/item_dbs").to route_to("item_dbs#create")
    end

    it "routes to #update" do
      expect(:put => "/item_dbs/1").to route_to("item_dbs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/item_dbs/1").to route_to("item_dbs#destroy", :id => "1")
    end

  end
end
