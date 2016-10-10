require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :account_id => 1,
      :username => "MyString",
      :unique_name => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :status => 1,
      :profile_responsibility_date => "MyString",
      :created_by => 1,
      :updated_by => 1,
      :avatar => "MyString",
      :bio => "MyString",
      :state => "MyString",
      :country => "MyString",
      :tagline => "MyString",
      :theme_music => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_account_id[name=?]", "user[account_id]"

      assert_select "input#user_username[name=?]", "user[username]"

      assert_select "input#user_unique_name[name=?]", "user[unique_name]"

      assert_select "input#user_first_name[name=?]", "user[first_name]"

      assert_select "input#user_last_name[name=?]", "user[last_name]"

      assert_select "input#user_status[name=?]", "user[status]"

      assert_select "input#user_profile_responsibility_date[name=?]", "user[profile_responsibility_date]"

      assert_select "input#user_created_by[name=?]", "user[created_by]"

      assert_select "input#user_updated_by[name=?]", "user[updated_by]"

      assert_select "input#user_avatar[name=?]", "user[avatar]"

      assert_select "input#user_bio[name=?]", "user[bio]"

      assert_select "input#user_state[name=?]", "user[state]"

      assert_select "input#user_country[name=?]", "user[country]"

      assert_select "input#user_tagline[name=?]", "user[tagline]"

      assert_select "input#user_theme_music[name=?]", "user[theme_music]"
    end
  end
end
