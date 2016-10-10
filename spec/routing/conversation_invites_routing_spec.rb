require "rails_helper"

RSpec.describe ConversationInvitesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/conversation_invites").to route_to("conversation_invites#index")
    end

    it "routes to #new" do
      expect(:get => "/conversation_invites/new").to route_to("conversation_invites#new")
    end

    it "routes to #show" do
      expect(:get => "/conversation_invites/1").to route_to("conversation_invites#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/conversation_invites/1/edit").to route_to("conversation_invites#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/conversation_invites").to route_to("conversation_invites#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/conversation_invites/1").to route_to("conversation_invites#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/conversation_invites/1").to route_to("conversation_invites#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/conversation_invites/1").to route_to("conversation_invites#destroy", :id => "1")
    end

  end
end
