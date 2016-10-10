require "rails_helper"

RSpec.describe VoteOptionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/vote_options").to route_to("vote_options#index")
    end

    it "routes to #new" do
      expect(:get => "/vote_options/new").to route_to("vote_options#new")
    end

    it "routes to #show" do
      expect(:get => "/vote_options/1").to route_to("vote_options#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/vote_options/1/edit").to route_to("vote_options#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/vote_options").to route_to("vote_options#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/vote_options/1").to route_to("vote_options#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/vote_options/1").to route_to("vote_options#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/vote_options/1").to route_to("vote_options#destroy", :id => "1")
    end

  end
end
