require 'rails_helper'

RSpec.describe "widget_styles/new", type: :view do
  before(:each) do
    assign(:widget_style, WidgetStyle.new(
      :name => "MyString",
      :description => "MyString",
      :style_data => "MyString",
      :status => "MyString",
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders new widget_style form" do
    render

    assert_select "form[action=?][method=?]", widget_styles_path, "post" do

      assert_select "input#widget_style_name[name=?]", "widget_style[name]"

      assert_select "input#widget_style_description[name=?]", "widget_style[description]"

      assert_select "input#widget_style_style_data[name=?]", "widget_style[style_data]"

      assert_select "input#widget_style_status[name=?]", "widget_style[status]"

      assert_select "input#widget_style_created_by[name=?]", "widget_style[created_by]"

      assert_select "input#widget_style_updated_by[name=?]", "widget_style[updated_by]"
    end
  end
end
