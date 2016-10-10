require 'rails_helper'

RSpec.describe "calendar_events/edit", type: :view do
  before(:each) do
    @calendar_event = assign(:calendar_event, CalendarEvent.create!(
      :name => "MyString",
      :description => "MyString",
      :event_contact => "MyString",
      :all_day => false,
      :visibility => nil,
      :status => "MyString",
      :profile => nil,
      :group => nil,
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders the edit calendar_event form" do
    render

    assert_select "form[action=?][method=?]", calendar_event_path(@calendar_event), "post" do

      assert_select "input#calendar_event_name[name=?]", "calendar_event[name]"

      assert_select "input#calendar_event_description[name=?]", "calendar_event[description]"

      assert_select "input#calendar_event_event_contact[name=?]", "calendar_event[event_contact]"

      assert_select "input#calendar_event_all_day[name=?]", "calendar_event[all_day]"

      assert_select "input#calendar_event_visibility_id[name=?]", "calendar_event[visibility_id]"

      assert_select "input#calendar_event_status[name=?]", "calendar_event[status]"

      assert_select "input#calendar_event_profile_id[name=?]", "calendar_event[profile_id]"

      assert_select "input#calendar_event_group_id[name=?]", "calendar_event[group_id]"

      assert_select "input#calendar_event_created_by[name=?]", "calendar_event[created_by]"

      assert_select "input#calendar_event_updated_by[name=?]", "calendar_event[updated_by]"
    end
  end
end
