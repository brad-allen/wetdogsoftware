require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :user_id => 1,
      :profile_name => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :status => 1,
      :created_by => 1,
      :updated_by => 1,
      :avatar => "MyString",
      :bio => "MyString",
      :state => "MyString",
      :country => "MyString",
      :tagline => "MyString",
      :theme_music => "MyString",
      :email => "MyString",
      :allow_all_connections => false,
      :allow_emails => false,
      :allow_all_conversations => false,
      :inform_user_of_actions => false,
      :allow_all_groups => false,
      :group_visibility => 1,
      :connection_visibility => 1,
      :user_visibility => 1,
      :public_visibility => 1
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "input#profile_user_id[name=?]", "profile[user_id]"

      assert_select "input#profile_profile_name[name=?]", "profile[profile_name]"

      assert_select "input#profile_first_name[name=?]", "profile[first_name]"

      assert_select "input#profile_last_name[name=?]", "profile[last_name]"

      assert_select "input#profile_status[name=?]", "profile[status]"

      assert_select "input#profile_created_by[name=?]", "profile[created_by]"

      assert_select "input#profile_updated_by[name=?]", "profile[updated_by]"

      assert_select "input#profile_avatar[name=?]", "profile[avatar]"

      assert_select "input#profile_bio[name=?]", "profile[bio]"

      assert_select "input#profile_state[name=?]", "profile[state]"

      assert_select "input#profile_country[name=?]", "profile[country]"

      assert_select "input#profile_tagline[name=?]", "profile[tagline]"

      assert_select "input#profile_theme_music[name=?]", "profile[theme_music]"

      assert_select "input#profile_email[name=?]", "profile[email]"

      assert_select "input#profile_allow_all_connections[name=?]", "profile[allow_all_connections]"

      assert_select "input#profile_allow_emails[name=?]", "profile[allow_emails]"

      assert_select "input#profile_allow_all_conversations[name=?]", "profile[allow_all_conversations]"

      assert_select "input#profile_inform_user_of_actions[name=?]", "profile[inform_user_of_actions]"

      assert_select "input#profile_allow_all_groups[name=?]", "profile[allow_all_groups]"

      assert_select "input#profile_group_visibility[name=?]", "profile[group_visibility]"

      assert_select "input#profile_connection_visibility[name=?]", "profile[connection_visibility]"

      assert_select "input#profile_user_visibility[name=?]", "profile[user_visibility]"

      assert_select "input#profile_public_visibility[name=?]", "profile[public_visibility]"
    end
  end
end
