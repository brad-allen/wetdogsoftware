require 'rails_helper'

RSpec.describe "GroupActions", type: :request do
  describe "GET /group_actions" do
    it "works! (now write some real specs)" do
      get group_actions_path
      expect(response).to have_http_status(200)
    end
  end
end
