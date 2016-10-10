require 'rails_helper'

RSpec.describe "ConversationInvites", type: :request do
  describe "GET /conversation_invites" do
    it "works! (now write some real specs)" do
      get conversation_invites_path
      expect(response).to have_http_status(200)
    end
  end
end
