require 'rails_helper'

RSpec.describe "profile_actions/show", type: :view do
  before(:each) do
    @profile_action = assign(:profile_action, ProfileAction.create!(
      :profile => nil,
      :action => "Action",
      :description => "Description",
      :visibility => nil,
      :status => "Status",
      :created_by => 2,
      :updated_by => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Action/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
