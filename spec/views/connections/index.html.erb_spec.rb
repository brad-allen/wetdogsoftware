require 'rails_helper'

RSpec.describe "connections/index", type: :view do
  before(:each) do
    assign(:connections, [
      Connection.create!(
        :profile => nil,
        :connection_profile => nil,
        :status => "Status",
        :created_by => 2,
        :updated_by => 3
      ),
      Connection.create!(
        :profile => nil,
        :connection_profile => nil,
        :status => "Status",
        :created_by => 2,
        :updated_by => 3
      )
    ])
  end

  it "renders a list of connections" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
