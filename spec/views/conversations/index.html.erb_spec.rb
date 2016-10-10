require 'rails_helper'

RSpec.describe "conversations/index", type: :view do
  before(:each) do
    assign(:conversations, [
      Conversation.create!(
        :title => "Title",
        :allow_html => false,
        :status => "Status",
        :created_by => 2,
        :updated_by => 3
      ),
      Conversation.create!(
        :title => "Title",
        :allow_html => false,
        :status => "Status",
        :created_by => 2,
        :updated_by => 3
      )
    ])
  end

  it "renders a list of conversations" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
