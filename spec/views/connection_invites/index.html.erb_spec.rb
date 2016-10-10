require 'rails_helper'

RSpec.describe "connection_invites/index", type: :view do
  before(:each) do
    assign(:connection_invites, [
      ConnectionInvite.create!(
        :profile => nil,
        :connection_profile => nil,
        :status => "Status",
        :created_by => 2,
        :updated_by => 3
      ),
      ConnectionInvite.create!(
        :profile => nil,
        :connection_profile => nil,
        :status => "Status",
        :created_by => 2,
        :updated_by => 3
      )
    ])
  end

  it "renders a list of connection_invites" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
