require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :account_id => 2,
        :username => "Username",
        :unique_name => "Unique Name",
        :first_name => "First Name",
        :last_name => "Last Name",
        :status => 3,
        :profile_responsibility_date => "Profile Responsibility Date",
        :created_by => 4,
        :updated_by => 5,
        :avatar => "Avatar",
        :bio => "Bio",
        :state => "State",
        :country => "Country",
        :tagline => "Tagline",
        :theme_music => "Theme Music"
      ),
      User.create!(
        :account_id => 2,
        :username => "Username",
        :unique_name => "Unique Name",
        :first_name => "First Name",
        :last_name => "Last Name",
        :status => 3,
        :profile_responsibility_date => "Profile Responsibility Date",
        :created_by => 4,
        :updated_by => 5,
        :avatar => "Avatar",
        :bio => "Bio",
        :state => "State",
        :country => "Country",
        :tagline => "Tagline",
        :theme_music => "Theme Music"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Unique Name".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Profile Responsibility Date".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "Avatar".to_s, :count => 2
    assert_select "tr>td", :text => "Bio".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Tagline".to_s, :count => 2
    assert_select "tr>td", :text => "Theme Music".to_s, :count => 2
  end
end
