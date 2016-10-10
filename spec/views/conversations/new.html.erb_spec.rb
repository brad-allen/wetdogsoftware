require 'rails_helper'

RSpec.describe "conversations/new", type: :view do
  before(:each) do
    assign(:conversation, Conversation.new(
      :title => "MyString",
      :allow_html => false,
      :status => "MyString",
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders new conversation form" do
    render

    assert_select "form[action=?][method=?]", conversations_path, "post" do

      assert_select "input#conversation_title[name=?]", "conversation[title]"

      assert_select "input#conversation_allow_html[name=?]", "conversation[allow_html]"

      assert_select "input#conversation_status[name=?]", "conversation[status]"

      assert_select "input#conversation_created_by[name=?]", "conversation[created_by]"

      assert_select "input#conversation_updated_by[name=?]", "conversation[updated_by]"
    end
  end
end
