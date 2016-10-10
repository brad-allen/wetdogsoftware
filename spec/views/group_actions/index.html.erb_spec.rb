require 'rails_helper'

RSpec.describe "group_actions/index", type: :view do
  before(:each) do
    assign(:group_actions, [
      GroupAction.create!(
        :group => nil,
        :profile => nil,
        :action => "Action",
        :description => "Description",
        :visibility => nil,
        :status => "Status",
        :created_by => 2,
        :updated_by => 3
      ),
      GroupAction.create!(
        :group => nil,
        :profile => nil,
        :action => "Action",
        :description => "Description",
        :visibility => nil,
        :status => "Status",
        :created_by => 2,
        :updated_by => 3
      )
    ])
  end

  it "renders a list of group_actions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Action".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
