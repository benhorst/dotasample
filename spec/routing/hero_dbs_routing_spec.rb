require "rails_helper"

RSpec.describe HeroDbsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/hero_dbs").to route_to("hero_dbs#index")
    end

    it "routes to #new" do
      expect(:get => "/hero_dbs/new").to route_to("hero_dbs#new")
    end

    it "routes to #show" do
      expect(:get => "/hero_dbs/1").to route_to("hero_dbs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hero_dbs/1/edit").to route_to("hero_dbs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/hero_dbs").to route_to("hero_dbs#create")
    end

    it "routes to #update" do
      expect(:put => "/hero_dbs/1").to route_to("hero_dbs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hero_dbs/1").to route_to("hero_dbs#destroy", :id => "1")
    end

  end
end
