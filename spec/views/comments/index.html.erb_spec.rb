require 'rails_helper'

RSpec.describe "comments/index", type: :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(
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
      ),
      Comment.create!(
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
      )
    ])
  end

  it "renders a list of comments" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
