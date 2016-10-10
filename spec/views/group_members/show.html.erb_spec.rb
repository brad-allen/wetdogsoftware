require 'rails_helper'

RSpec.describe "group_members/show", type: :view do
  before(:each) do
    @group_member = assign(:group_member, GroupMember.create!(
      :group => nil,
      :profile => nil,
      :status => "Status",
      :created_by => 2,
      :updated_by => 3,
      :is_admin => false,
      :can_post => false,
      :can_add_events => false,
      :can_comment => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
