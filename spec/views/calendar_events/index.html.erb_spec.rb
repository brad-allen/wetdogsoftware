require 'rails_helper'

RSpec.describe "calendar_events/index", type: :view do
  before(:each) do
    assign(:calendar_events, [
      CalendarEvent.create!(
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
      ),
      CalendarEvent.create!(
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
      )
    ])
  end

  it "renders a list of calendar_events" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Event Contact".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
