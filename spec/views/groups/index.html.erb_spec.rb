require 'rails_helper'

RSpec.describe "groups/index", type: :view do
  before(:each) do
    assign(:groups, [
      Group.create!(
        :name => "Name",
        :description => "Description",
        :status => "Status",
        :created_by => 2,
        :updated_by => 3,
        :visibility => nil,
        :group_type => "Group Type"
      ),
      Group.create!(
        :name => "Name",
        :description => "Description",
        :status => "Status",
        :created_by => 2,
        :updated_by => 3,
        :visibility => nil,
        :group_type => "Group Type"
      )
    ])
  end

  it "renders a list of groups" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Group Type".to_s, :count => 2
  end
end
