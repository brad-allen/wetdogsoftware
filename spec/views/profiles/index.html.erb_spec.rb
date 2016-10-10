require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        :user_id => 2,
        :profile_name => "Profile Name",
        :first_name => "First Name",
        :last_name => "Last Name",
        :status => 3,
        :created_by => 4,
        :updated_by => 5,
        :avatar => "Avatar",
        :bio => "Bio",
        :state => "State",
        :country => "Country",
        :tagline => "Tagline",
        :theme_music => "Theme Music",
        :email => "Email",
        :allow_all_connections => false,
        :allow_emails => false,
        :allow_all_conversations => false,
        :inform_user_of_actions => false,
        :allow_all_groups => false,
        :group_visibility => 6,
        :connection_visibility => 7,
        :user_visibility => 8,
        :public_visibility => 9
      ),
      Profile.create!(
        :user_id => 2,
        :profile_name => "Profile Name",
        :first_name => "First Name",
        :last_name => "Last Name",
        :status => 3,
        :created_by => 4,
        :updated_by => 5,
        :avatar => "Avatar",
        :bio => "Bio",
        :state => "State",
        :country => "Country",
        :tagline => "Tagline",
        :theme_music => "Theme Music",
        :email => "Email",
        :allow_all_connections => false,
        :allow_emails => false,
        :allow_all_conversations => false,
        :inform_user_of_actions => false,
        :allow_all_groups => false,
        :group_visibility => 6,
        :connection_visibility => 7,
        :user_visibility => 8,
        :public_visibility => 9
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Profile Name".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "Avatar".to_s, :count => 2
    assert_select "tr>td", :text => "Bio".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Tagline".to_s, :count => 2
    assert_select "tr>td", :text => "Theme Music".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
  end
end
