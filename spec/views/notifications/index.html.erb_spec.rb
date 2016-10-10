require 'rails_helper'

RSpec.describe "notifications/index", type: :view do
  before(:each) do
    assign(:notifications, [
      Notification.create!(
        :calendar_event => nil,
        :notification_text => "Notification Text",
        :importance => "Importance",
        :status => "Status",
        :sleep_count => 2,
        :created_by => 3,
        :updated_by => 4
      ),
      Notification.create!(
        :calendar_event => nil,
        :notification_text => "Notification Text",
        :importance => "Importance",
        :status => "Status",
        :sleep_count => 2,
        :created_by => 3,
        :updated_by => 4
      )
    ])
  end

  it "renders a list of notifications" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Notification Text".to_s, :count => 2
    assert_select "tr>td", :text => "Importance".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
