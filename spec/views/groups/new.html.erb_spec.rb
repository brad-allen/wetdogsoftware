require 'rails_helper'

RSpec.describe "groups/new", type: :view do
  before(:each) do
    assign(:group, Group.new(
      :name => "MyString",
      :description => "MyString",
      :status => "MyString",
      :created_by => 1,
      :updated_by => 1,
      :visibility => nil,
      :group_type => "MyString"
    ))
  end

  it "renders new group form" do
    render

    assert_select "form[action=?][method=?]", groups_path, "post" do

      assert_select "input#group_name[name=?]", "group[name]"

      assert_select "input#group_description[name=?]", "group[description]"

      assert_select "input#group_status[name=?]", "group[status]"

      assert_select "input#group_created_by[name=?]", "group[created_by]"

      assert_select "input#group_updated_by[name=?]", "group[updated_by]"

      assert_select "input#group_visibility_id[name=?]", "group[visibility_id]"

      assert_select "input#group_group_type[name=?]", "group[group_type]"
    end
  end
end
