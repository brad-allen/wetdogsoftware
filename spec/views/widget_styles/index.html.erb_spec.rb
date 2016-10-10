require 'rails_helper'

RSpec.describe "widget_styles/index", type: :view do
  before(:each) do
    assign(:widget_styles, [
      WidgetStyle.create!(
        :name => "Name",
        :description => "Description",
        :style_data => "Style Data",
        :status => "Status",
        :created_by => 2,
        :updated_by => 3
      ),
      WidgetStyle.create!(
        :name => "Name",
        :description => "Description",
        :style_data => "Style Data",
        :status => "Status",
        :created_by => 2,
        :updated_by => 3
      )
    ])
  end

  it "renders a list of widget_styles" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Style Data".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
