require 'rails_helper'

RSpec.describe "group_invites/edit", type: :view do
  before(:each) do
    @group_invite = assign(:group_invite, GroupInvite.create!(
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

  it "renders the edit group_invite form" do
    render

    assert_select "form[action=?][method=?]", group_invite_path(@group_invite), "post" do

      assert_select "input#group_invite_group_id[name=?]", "group_invite[group_id]"

      assert_select "input#group_invite_profile_id[name=?]", "group_invite[profile_id]"

      assert_select "input#group_invite_status[name=?]", "group_invite[status]"

      assert_select "input#group_invite_created_by[name=?]", "group_invite[created_by]"

      assert_select "input#group_invite_updated_by[name=?]", "group_invite[updated_by]"

      assert_select "input#group_invite_is_admin[name=?]", "group_invite[is_admin]"

      assert_select "input#group_invite_can_post[name=?]", "group_invite[can_post]"

      assert_select "input#group_invite_can_add_events[name=?]", "group_invite[can_add_events]"

      assert_select "input#group_invite_can_comment[name=?]", "group_invite[can_comment]"
    end
  end
end
