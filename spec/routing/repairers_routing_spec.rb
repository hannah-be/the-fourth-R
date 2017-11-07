require "rails_helper"

RSpec.describe RepairersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/repairers").to route_to("repairers#index")
    end

    it "routes to #new" do
      expect(:get => "/repairers/new").to route_to("repairers#new")
    end

    it "routes to #show" do
      expect(:get => "/repairers/1").to route_to("repairers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/repairers/1/edit").to route_to("repairers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/repairers").to route_to("repairers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/repairers/1").to route_to("repairers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/repairers/1").to route_to("repairers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/repairers/1").to route_to("repairers#destroy", :id => "1")
    end

  end
end
