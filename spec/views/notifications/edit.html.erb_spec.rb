require 'rails_helper'

RSpec.describe "notifications/edit", type: :view do
  before(:each) do
    @notification = assign(:notification, Notification.create!(
      :calendar_event => nil,
      :notification_text => "MyString",
      :importance => "MyString",
      :status => "MyString",
      :sleep_count => 1,
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders the edit notification form" do
    render

    assert_select "form[action=?][method=?]", notification_path(@notification), "post" do

      assert_select "input#notification_calendar_event_id[name=?]", "notification[calendar_event_id]"

      assert_select "input#notification_notification_text[name=?]", "notification[notification_text]"

      assert_select "input#notification_importance[name=?]", "notification[importance]"

      assert_select "input#notification_status[name=?]", "notification[status]"

      assert_select "input#notification_sleep_count[name=?]", "notification[sleep_count]"

      assert_select "input#notification_created_by[name=?]", "notification[created_by]"

      assert_select "input#notification_updated_by[name=?]", "notification[updated_by]"
    end
  end
end
