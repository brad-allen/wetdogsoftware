require 'rails_helper'

RSpec.describe "messages/edit", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      :conversation => nil,
      :profile => nil,
      :content => "MyString",
      :status => "MyString",
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders the edit message form" do
    render

    assert_select "form[action=?][method=?]", message_path(@message), "post" do

      assert_select "input#message_conversation_id[name=?]", "message[conversation_id]"

      assert_select "input#message_profile_id[name=?]", "message[profile_id]"

      assert_select "input#message_content[name=?]", "message[content]"

      assert_select "input#message_status[name=?]", "message[status]"

      assert_select "input#message_created_by[name=?]", "message[created_by]"

      assert_select "input#message_updated_by[name=?]", "message[updated_by]"
    end
  end
end
