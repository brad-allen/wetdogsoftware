require 'rails_helper'

RSpec.describe "group_members/new", type: :view do
  before(:each) do
    assign(:group_member, GroupMember.new(
      :group => nil,
      :profile => nil,
      :status => "MyString",
      :created_by => 1,
      :updated_by => 1,
      :is_admin => false,
      :can_post => false,
      :can_add_events => false,
      :can_comment => false
    ))
  end

  it "renders new group_member form" do
    render

    assert_select "form[action=?][method=?]", group_members_path, "post" do

      assert_select "input#group_member_group_id[name=?]", "group_member[group_id]"

      assert_select "input#group_member_profile_id[name=?]", "group_member[profile_id]"

      assert_select "input#group_member_status[name=?]", "group_member[status]"

      assert_select "input#group_member_created_by[name=?]", "group_member[created_by]"

      assert_select "input#group_member_updated_by[name=?]", "group_member[updated_by]"

      assert_select "input#group_member_is_admin[name=?]", "group_member[is_admin]"

      assert_select "input#group_member_can_post[name=?]", "group_member[can_post]"

      assert_select "input#group_member_can_add_events[name=?]", "group_member[can_add_events]"

      assert_select "input#group_member_can_comment[name=?]", "group_member[can_comment]"
    end
  end
end
