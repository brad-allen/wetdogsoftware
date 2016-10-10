require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :profile => nil,
        :group => nil,
        :visibility => nil,
        :post_type => "Post Type",
        :content => "Content",
        :image => "Image",
        :thumb_image => "Thumb Image",
        :status => "Status"
      ),
      Post.create!(
        :profile => nil,
        :group => nil,
        :visibility => nil,
        :post_type => "Post Type",
        :content => "Content",
        :image => "Image",
        :thumb_image => "Thumb Image",
        :status => "Status"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Post Type".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Thumb Image".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
