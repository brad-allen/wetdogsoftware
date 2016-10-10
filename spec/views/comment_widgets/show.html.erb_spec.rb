require 'rails_helper'

RSpec.describe "comment_widgets/show", type: :view do
  before(:each) do
    @comment_widget = assign(:comment_widget, CommentWidget.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(//)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
  end
end
