require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Unique Name/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Profile Responsibility Date/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/Avatar/)
    expect(rendered).to match(/Bio/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Tagline/)
    expect(rendered).to match(/Theme Music/)
  end
end
