require 'rails_helper'

RSpec.describe "CommentWidgets", type: :request do
  describe "GET /comment_widgets" do
    it "works! (now write some real specs)" do
      get comment_widgets_path
      expect(response).to have_http_status(200)
    end
  end
end
