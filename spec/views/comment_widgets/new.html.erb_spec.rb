require 'rails_helper'

RSpec.describe "comment_widgets/new", type: :view do
  before(:each) do
    assign(:comment_widget, CommentWidget.new(
      :post => nil,
      :allow_api_access => false,
      :description => "MyString",
      :current_score => 1,
      :commenter_count => 1,
      :voter_count => 1,
      :status => "MyString",
      :widget_style => nil,
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders new comment_widget form" do
    render

    assert_select "form[action=?][method=?]", comment_widgets_path, "post" do

      assert_select "input#comment_widget_post_id[name=?]", "comment_widget[post_id]"

      assert_select "input#comment_widget_allow_api_access[name=?]", "comment_widget[allow_api_access]"

      assert_select "input#comment_widget_description[name=?]", "comment_widget[description]"

      assert_select "input#comment_widget_current_score[name=?]", "comment_widget[current_score]"

      assert_select "input#comment_widget_commenter_count[name=?]", "comment_widget[commenter_count]"

      assert_select "input#comment_widget_voter_count[name=?]", "comment_widget[voter_count]"

      assert_select "input#comment_widget_status[name=?]", "comment_widget[status]"

      assert_select "input#comment_widget_widget_style_id[name=?]", "comment_widget[widget_style_id]"

      assert_select "input#comment_widget_created_by[name=?]", "comment_widget[created_by]"

      assert_select "input#comment_widget_updated_by[name=?]", "comment_widget[updated_by]"
    end
  end
end
