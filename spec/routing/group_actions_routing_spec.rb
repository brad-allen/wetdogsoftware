require "rails_helper"

RSpec.describe GroupActionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/group_actions").to route_to("group_actions#index")
    end

    it "routes to #new" do
      expect(:get => "/group_actions/new").to route_to("group_actions#new")
    end

    it "routes to #show" do
      expect(:get => "/group_actions/1").to route_to("group_actions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/group_actions/1/edit").to route_to("group_actions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/group_actions").to route_to("group_actions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/group_actions/1").to route_to("group_actions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/group_actions/1").to route_to("group_actions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/group_actions/1").to route_to("group_actions#destroy", :id => "1")
    end

  end
end
