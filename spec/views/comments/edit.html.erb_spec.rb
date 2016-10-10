require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :profile => nil,
      :comment_widget => nil,
      :content => "MyString",
      :vote_score => 1,
      :upvote => false,
      :downvote => false,
      :status => "MyString",
      :visibility => nil,
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input#comment_profile_id[name=?]", "comment[profile_id]"

      assert_select "input#comment_comment_widget_id[name=?]", "comment[comment_widget_id]"

      assert_select "input#comment_content[name=?]", "comment[content]"

      assert_select "input#comment_vote_score[name=?]", "comment[vote_score]"

      assert_select "input#comment_upvote[name=?]", "comment[upvote]"

      assert_select "input#comment_downvote[name=?]", "comment[downvote]"

      assert_select "input#comment_status[name=?]", "comment[status]"

      assert_select "input#comment_visibility_id[name=?]", "comment[visibility_id]"

      assert_select "input#comment_created_by[name=?]", "comment[created_by]"

      assert_select "input#comment_updated_by[name=?]", "comment[updated_by]"
    end
  end
end
