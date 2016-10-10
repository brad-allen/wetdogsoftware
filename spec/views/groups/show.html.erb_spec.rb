require 'rails_helper'

RSpec.describe "groups/show", type: :view do
  before(:each) do
    @group = assign(:group, Group.create!(
      :name => "Name",
      :description => "Description",
      :status => "Status",
      :created_by => 2,
      :updated_by => 3,
      :visibility => nil,
      :group_type => "Group Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Group Type/)
  end
end
