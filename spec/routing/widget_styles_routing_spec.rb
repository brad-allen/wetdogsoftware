require "rails_helper"

RSpec.describe WidgetStylesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/widget_styles").to route_to("widget_styles#index")
    end

    it "routes to #new" do
      expect(:get => "/widget_styles/new").to route_to("widget_styles#new")
    end

    it "routes to #show" do
      expect(:get => "/widget_styles/1").to route_to("widget_styles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/widget_styles/1/edit").to route_to("widget_styles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/widget_styles").to route_to("widget_styles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/widget_styles/1").to route_to("widget_styles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/widget_styles/1").to route_to("widget_styles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/widget_styles/1").to route_to("widget_styles#destroy", :id => "1")
    end

  end
end
