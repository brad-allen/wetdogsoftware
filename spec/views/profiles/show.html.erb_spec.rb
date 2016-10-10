require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Profile Name/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/Avatar/)
    expect(rendered).to match(/Bio/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Tagline/)
    expect(rendered).to match(/Theme Music/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/9/)
  end
end
