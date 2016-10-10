require 'rails_helper'

RSpec.describe "pages/index", type: :view do
  before(:each) do
    assign(:pages, [
      Page.create!(
        :profile => nil,
        :name => "Name",
        :description => "Description",
        :page_order => 2,
        :status => "Status",
        :group_visibility => "Group Visibility",
        :connection_visibility => "Connection Visibility",
        :users_visibility => "Users Visibility",
        :public_visibility => "Public Visibility",
        :rating => "Rating",
        :created_by => 3,
        :updated_by => 4
      ),
      Page.create!(
        :profile => nil,
        :name => "Name",
        :description => "Description",
        :page_order => 2,
        :status => "Status",
        :group_visibility => "Group Visibility",
        :connection_visibility => "Connection Visibility",
        :users_visibility => "Users Visibility",
        :public_visibility => "Public Visibility",
        :rating => "Rating",
        :created_by => 3,
        :updated_by => 4
      )
    ])
  end

  it "renders a list of pages" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Group Visibility".to_s, :count => 2
    assert_select "tr>td", :text => "Connection Visibility".to_s, :count => 2
    assert_select "tr>td", :text => "Users Visibility".to_s, :count => 2
    assert_select "tr>td", :text => "Public Visibility".to_s, :count => 2
    assert_select "tr>td", :text => "Rating".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
