require 'rails_helper'

RSpec.describe "group_invites/index", type: :view do
  before(:each) do
    assign(:group_invites, [
      GroupInvite.create!(
        :group => nil,
        :profile => nil,
        :status => "Status",
        :created_by => 2,
        :updated_by => 3,
        :is_admin => false,
        :can_post => false,
        :can_add_events => false,
        :can_comment => false
      ),
      GroupInvite.create!(
        :group => nil,
        :profile => nil,
        :status => "Status",
        :created_by => 2,
        :updated_by => 3,
        :is_admin => false,
        :can_post => false,
        :can_add_events => false,
        :can_comment => false
      )
    ])
  end

  it "renders a list of group_invites" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
