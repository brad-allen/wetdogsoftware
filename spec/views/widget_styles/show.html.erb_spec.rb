require 'rails_helper'

RSpec.describe "widget_styles/show", type: :view do
  before(:each) do
    @widget_style = assign(:widget_style, WidgetStyle.create!(
      :name => "Name",
      :description => "Description",
      :style_data => "Style Data",
      :status => "Status",
      :created_by => 2,
      :updated_by => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Style Data/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
