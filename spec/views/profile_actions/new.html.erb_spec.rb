require 'rails_helper'

RSpec.describe "profile_actions/new", type: :view do
  before(:each) do
    assign(:profile_action, ProfileAction.new(
      :profile => nil,
      :action => "MyString",
      :description => "MyString",
      :visibility => nil,
      :status => "MyString",
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders new profile_action form" do
    render

    assert_select "form[action=?][method=?]", profile_actions_path, "post" do

      assert_select "input#profile_action_profile_id[name=?]", "profile_action[profile_id]"

      assert_select "input#profile_action_action[name=?]", "profile_action[action]"

      assert_select "input#profile_action_description[name=?]", "profile_action[description]"

      assert_select "input#profile_action_visibility_id[name=?]", "profile_action[visibility_id]"

      assert_select "input#profile_action_status[name=?]", "profile_action[status]"

      assert_select "input#profile_action_created_by[name=?]", "profile_action[created_by]"

      assert_select "input#profile_action_updated_by[name=?]", "profile_action[updated_by]"
    end
  end
end
