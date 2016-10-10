require 'rails_helper'

RSpec.describe "comments/show", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :profile => nil,
      :comment_widget => nil,
      :content => "Content",
      :vote_score => 2,
      :upvote => false,
      :downvote => false,
      :status => "Status",
      :visibility => nil,
      :created_by => 3,
      :updated_by => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(//)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
