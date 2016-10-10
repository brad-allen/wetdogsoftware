require 'rails_helper'

RSpec.describe "pages/show", type: :view do
  before(:each) do
    @page = assign(:page, Page.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Group Visibility/)
    expect(rendered).to match(/Connection Visibility/)
    expect(rendered).to match(/Users Visibility/)
    expect(rendered).to match(/Public Visibility/)
    expect(rendered).to match(/Rating/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
