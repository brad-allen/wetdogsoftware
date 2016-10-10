require 'rails_helper'

RSpec.describe "conversation_invites/edit", type: :view do
  before(:each) do
    @conversation_invite = assign(:conversation_invite, ConversationInvite.create!(
      :conversation => nil,
      :profile => nil,
      :invited_profile => nil,
      :status => "MyString",
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders the edit conversation_invite form" do
    render

    assert_select "form[action=?][method=?]", conversation_invite_path(@conversation_invite), "post" do

      assert_select "input#conversation_invite_conversation_id[name=?]", "conversation_invite[conversation_id]"

      assert_select "input#conversation_invite_profile_id[name=?]", "conversation_invite[profile_id]"

      assert_select "input#conversation_invite_invited_profile_id[name=?]", "conversation_invite[invited_profile_id]"

      assert_select "input#conversation_invite_status[name=?]", "conversation_invite[status]"

      assert_select "input#conversation_invite_created_by[name=?]", "conversation_invite[created_by]"

      assert_select "input#conversation_invite_updated_by[name=?]", "conversation_invite[updated_by]"
    end
  end
end
