require 'rails_helper'

RSpec.describe "VoteOptions", type: :request do
  describe "GET /vote_options" do
    it "works! (now write some real specs)" do
      get vote_options_path
      expect(response).to have_http_status(200)
    end
  end
end
