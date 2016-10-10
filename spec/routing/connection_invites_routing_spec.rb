require "rails_helper"

RSpec.describe ConnectionInvitesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/connection_invites").to route_to("connection_invites#index")
    end

    it "routes to #new" do
      expect(:get => "/connection_invites/new").to route_to("connection_invites#new")
    end

    it "routes to #show" do
      expect(:get => "/connection_invites/1").to route_to("connection_invites#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/connection_invites/1/edit").to route_to("connection_invites#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/connection_invites").to route_to("connection_invites#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/connection_invites/1").to route_to("connection_invites#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/connection_invites/1").to route_to("connection_invites#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/connection_invites/1").to route_to("connection_invites#destroy", :id => "1")
    end

  end
end
