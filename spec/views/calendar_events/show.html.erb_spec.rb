require 'rails_helper'

RSpec.describe "calendar_events/show", type: :view do
  before(:each) do
    @calendar_event = assign(:calendar_event, CalendarEvent.create!(
      :name => "Name",
      :description => "Description",
      :event_contact => "Event Contact",
      :all_day => false,
      :visibility => nil,
      :status => "Status",
      :profile => nil,
      :group => nil,
      :created_by => 2,
      :updated_by => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Event Contact/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
