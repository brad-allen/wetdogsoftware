require 'rails_helper'

RSpec.describe "comment_widgets/index", type: :view do
  before(:each) do
    assign(:comment_widgets, [
      CommentWidget.create!(
        :post => nil,
        :allow_api_access => false,
        :description => "Description",
        :current_score => 2,
        :commenter_count => 3,
        :voter_count => 4,
        :status => "Status",
        :widget_style => nil,
        :created_by => 5,
        :updated_by => 6
      ),
      CommentWidget.create!(
        :post => nil,
        :allow_api_access => false,
        :description => "Description",
        :current_score => 2,
        :commenter_count => 3,
        :voter_count => 4,
        :status => "Status",
        :widget_style => nil,
        :created_by => 5,
        :updated_by => 6
      )
    ])
  end

  it "renders a list of comment_widgets" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
  end
end
