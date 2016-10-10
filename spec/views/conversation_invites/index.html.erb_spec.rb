require 'rails_helper'

RSpec.describe "conversation_invites/index", type: :view do
  before(:each) do
    assign(:conversation_invites, [
      ConversationInvite.create!(
        :conversation => nil,
        :profile => nil,
        :invited_profile => nil,
        :status => "Status",
        :created_by => 2,
        :updated_by => 3
      ),
      ConversationInvite.create!(
        :conversation => nil,
        :profile => nil,
        :invited_profile => nil,
        :status => "Status",
        :created_by => 2,
        :updated_by => 3
      )
    ])
  end

  it "renders a list of conversation_invites" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
