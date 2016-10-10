require 'rails_helper'

RSpec.describe "ConnectionInvites", type: :request do
  describe "GET /connection_invites" do
    it "works! (now write some real specs)" do
      get connection_invites_path
      expect(response).to have_http_status(200)
    end
  end
end
