require "rails_helper"

RSpec.describe ConversationMembersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/conversation_members").to route_to("conversation_members#index")
    end

    it "routes to #new" do
      expect(:get => "/conversation_members/new").to route_to("conversation_members#new")
    end

    it "routes to #show" do
      expect(:get => "/conversation_members/1").to route_to("conversation_members#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/conversation_members/1/edit").to route_to("conversation_members#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/conversation_members").to route_to("conversation_members#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/conversation_members/1").to route_to("conversation_members#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/conversation_members/1").to route_to("conversation_members#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/conversation_members/1").to route_to("conversation_members#destroy", :id => "1")
    end

  end
end
