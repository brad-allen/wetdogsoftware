require 'rails_helper'

RSpec.describe "GroupInvites", type: :request do
  describe "GET /group_invites" do
    it "works! (now write some real specs)" do
      get group_invites_path
      expect(response).to have_http_status(200)
    end
  end
end
