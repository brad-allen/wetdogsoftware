require 'rails_helper'

RSpec.describe "messages/new", type: :view do
  before(:each) do
    assign(:message, Message.new(
      :conversation => nil,
      :profile => nil,
      :content => "MyString",
      :status => "MyString",
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders new message form" do
    render

    assert_select "form[action=?][method=?]", messages_path, "post" do

      assert_select "input#message_conversation_id[name=?]", "message[conversation_id]"

      assert_select "input#message_profile_id[name=?]", "message[profile_id]"

      assert_select "input#message_content[name=?]", "message[content]"

      assert_select "input#message_status[name=?]", "message[status]"

      assert_select "input#message_created_by[name=?]", "message[created_by]"

      assert_select "input#message_updated_by[name=?]", "message[updated_by]"
    end
  end
end
