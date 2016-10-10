require 'rails_helper'

RSpec.describe "conversation_members/new", type: :view do
  before(:each) do
    assign(:conversation_member, ConversationMember.new(
      :conversation => nil,
      :profile => nil,
      :status => "MyString",
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders new conversation_member form" do
    render

    assert_select "form[action=?][method=?]", conversation_members_path, "post" do

      assert_select "input#conversation_member_conversation_id[name=?]", "conversation_member[conversation_id]"

      assert_select "input#conversation_member_profile_id[name=?]", "conversation_member[profile_id]"

      assert_select "input#conversation_member_status[name=?]", "conversation_member[status]"

      assert_select "input#conversation_member_created_by[name=?]", "conversation_member[created_by]"

      assert_select "input#conversation_member_updated_by[name=?]", "conversation_member[updated_by]"
    end
  end
end
