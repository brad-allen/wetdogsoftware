require "rails_helper"

RSpec.describe ProfileActionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/profile_actions").to route_to("profile_actions#index")
    end

    it "routes to #new" do
      expect(:get => "/profile_actions/new").to route_to("profile_actions#new")
    end

    it "routes to #show" do
      expect(:get => "/profile_actions/1").to route_to("profile_actions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/profile_actions/1/edit").to route_to("profile_actions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/profile_actions").to route_to("profile_actions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/profile_actions/1").to route_to("profile_actions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/profile_actions/1").to route_to("profile_actions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/profile_actions/1").to route_to("profile_actions#destroy", :id => "1")
    end

  end
end
