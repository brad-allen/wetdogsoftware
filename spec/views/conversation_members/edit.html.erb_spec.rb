require 'rails_helper'

RSpec.describe "conversation_members/edit", type: :view do
  before(:each) do
    @conversation_member = assign(:conversation_member, ConversationMember.create!(
      :conversation => nil,
      :profile => nil,
      :status => "MyString",
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders the edit conversation_member form" do
    render

    assert_select "form[action=?][method=?]", conversation_member_path(@conversation_member), "post" do

      assert_select "input#conversation_member_conversation_id[name=?]", "conversation_member[conversation_id]"

      assert_select "input#conversation_member_profile_id[name=?]", "conversation_member[profile_id]"

      assert_select "input#conversation_member_status[name=?]", "conversation_member[status]"

      assert_select "input#conversation_member_created_by[name=?]", "conversation_member[created_by]"

      assert_select "input#conversation_member_updated_by[name=?]", "conversation_member[updated_by]"
    end
  end
end
