require 'rails_helper'

RSpec.describe "pages/edit", type: :view do
  before(:each) do
    @page = assign(:page, Page.create!(
      :profile => nil,
      :name => "MyString",
      :description => "MyString",
      :page_order => 1,
      :status => "MyString",
      :group_visibility => "MyString",
      :connection_visibility => "MyString",
      :users_visibility => "MyString",
      :public_visibility => "MyString",
      :rating => "MyString",
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders the edit page form" do
    render

    assert_select "form[action=?][method=?]", page_path(@page), "post" do

      assert_select "input#page_profile_id[name=?]", "page[profile_id]"

      assert_select "input#page_name[name=?]", "page[name]"

      assert_select "input#page_description[name=?]", "page[description]"

      assert_select "input#page_page_order[name=?]", "page[page_order]"

      assert_select "input#page_status[name=?]", "page[status]"

      assert_select "input#page_group_visibility[name=?]", "page[group_visibility]"

      assert_select "input#page_connection_visibility[name=?]", "page[connection_visibility]"

      assert_select "input#page_users_visibility[name=?]", "page[users_visibility]"

      assert_select "input#page_public_visibility[name=?]", "page[public_visibility]"

      assert_select "input#page_rating[name=?]", "page[rating]"

      assert_select "input#page_created_by[name=?]", "page[created_by]"

      assert_select "input#page_updated_by[name=?]", "page[updated_by]"
    end
  end
end
