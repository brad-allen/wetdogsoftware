require 'rails_helper'

RSpec.describe "profile_actions/index", type: :view do
  before(:each) do
    assign(:profile_actions, [
      ProfileAction.create!(
        :profile => nil,
        :action => "Action",
        :description => "Description",
        :visibility => nil,
        :status => "Status",
        :created_by => 2,
        :updated_by => 3
      ),
      ProfileAction.create!(
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

  it "renders a list of profile_actions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Action".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
