require 'rails_helper'

RSpec.describe "Visibilities", type: :request do
  describe "GET /visibilities" do
    it "works! (now write some real specs)" do
      get visibilities_path
      expect(response).to have_http_status(200)
    end
  end
end
