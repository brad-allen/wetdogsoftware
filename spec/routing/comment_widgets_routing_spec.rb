require "rails_helper"

RSpec.describe CommentWidgetsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/comment_widgets").to route_to("comment_widgets#index")
    end

    it "routes to #new" do
      expect(:get => "/comment_widgets/new").to route_to("comment_widgets#new")
    end

    it "routes to #show" do
      expect(:get => "/comment_widgets/1").to route_to("comment_widgets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/comment_widgets/1/edit").to route_to("comment_widgets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/comment_widgets").to route_to("comment_widgets#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/comment_widgets/1").to route_to("comment_widgets#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/comment_widgets/1").to route_to("comment_widgets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/comment_widgets/1").to route_to("comment_widgets#destroy", :id => "1")
    end

  end
end
