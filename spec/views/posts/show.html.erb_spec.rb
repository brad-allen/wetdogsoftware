require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :profile => nil,
      :group => nil,
      :visibility => nil,
      :post_type => "Post Type",
      :content => "Content",
      :image => "Image",
      :thumb_image => "Thumb Image",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Post Type/)
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Thumb Image/)
    expect(rendered).to match(/Status/)
  end
end
