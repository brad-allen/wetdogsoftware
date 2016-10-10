require 'rails_helper'

RSpec.describe "ConversationMembers", type: :request do
  describe "GET /conversation_members" do
    it "works! (now write some real specs)" do
      get conversation_members_path
      expect(response).to have_http_status(200)
    end
  end
end
