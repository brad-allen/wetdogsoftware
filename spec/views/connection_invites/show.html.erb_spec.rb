require 'rails_helper'

RSpec.describe "connection_invites/show", type: :view do
  before(:each) do
    @connection_invite = assign(:connection_invite, ConnectionInvite.create!(
      :profile => nil,
      :connection_profile => nil,
      :status => "Status",
      :created_by => 2,
      :updated_by => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
