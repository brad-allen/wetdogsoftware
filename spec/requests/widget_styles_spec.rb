require 'rails_helper'

RSpec.describe "WidgetStyles", type: :request do
  describe "GET /widget_styles" do
    it "works! (now write some real specs)" do
      get widget_styles_path
      expect(response).to have_http_status(200)
    end
  end
end
