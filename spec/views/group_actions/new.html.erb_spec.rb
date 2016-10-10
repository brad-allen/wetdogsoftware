require 'rails_helper'

RSpec.describe "group_actions/new", type: :view do
  before(:each) do
    assign(:group_action, GroupAction.new(
      :group => nil,
      :profile => nil,
      :action => "MyString",
      :description => "MyString",
      :visibility => nil,
      :status => "MyString",
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders new group_action form" do
    render

    assert_select "form[action=?][method=?]", group_actions_path, "post" do

      assert_select "input#group_action_group_id[name=?]", "group_action[group_id]"

      assert_select "input#group_action_profile_id[name=?]", "group_action[profile_id]"

      assert_select "input#group_action_action[name=?]", "group_action[action]"

      assert_select "input#group_action_description[name=?]", "group_action[description]"

      assert_select "input#group_action_visibility_id[name=?]", "group_action[visibility_id]"

      assert_select "input#group_action_status[name=?]", "group_action[status]"

      assert_select "input#group_action_created_by[name=?]", "group_action[created_by]"

      assert_select "input#group_action_updated_by[name=?]", "group_action[updated_by]"
    end
  end
end
