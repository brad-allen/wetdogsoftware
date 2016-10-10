require 'rails_helper'

RSpec.describe "notifications/show", type: :view do
  before(:each) do
    @notification = assign(:notification, Notification.create!(
      :calendar_event => nil,
      :notification_text => "Notification Text",
      :importance => "Importance",
      :status => "Status",
      :sleep_count => 2,
      :created_by => 3,
      :updated_by => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Notification Text/)
    expect(rendered).to match(/Importance/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
