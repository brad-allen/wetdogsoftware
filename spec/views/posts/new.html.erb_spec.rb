require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      :profile => nil,
      :group => nil,
      :visibility => nil,
      :post_type => "MyString",
      :content => "MyString",
      :image => "MyString",
      :thumb_image => "MyString",
      :status => "MyString"
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input#post_profile_id[name=?]", "post[profile_id]"

      assert_select "input#post_group_id[name=?]", "post[group_id]"

      assert_select "input#post_visibility_id[name=?]", "post[visibility_id]"

      assert_select "input#post_post_type[name=?]", "post[post_type]"

      assert_select "input#post_content[name=?]", "post[content]"

      assert_select "input#post_image[name=?]", "post[image]"

      assert_select "input#post_thumb_image[name=?]", "post[thumb_image]"

      assert_select "input#post_status[name=?]", "post[status]"
    end
  end
end
