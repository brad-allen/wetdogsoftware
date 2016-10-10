require 'rails_helper'

RSpec.describe "vote_options/new", type: :view do
  before(:each) do
    assign(:vote_option, VoteOption.new(
      :name => "MyString",
      :description => "MyString",
      :value => 1,
      :image => "MyString",
      :widget_style => nil,
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders new vote_option form" do
    render

    assert_select "form[action=?][method=?]", vote_options_path, "post" do

      assert_select "input#vote_option_name[name=?]", "vote_option[name]"

      assert_select "input#vote_option_description[name=?]", "vote_option[description]"

      assert_select "input#vote_option_value[name=?]", "vote_option[value]"

      assert_select "input#vote_option_image[name=?]", "vote_option[image]"

      assert_select "input#vote_option_widget_style_id[name=?]", "vote_option[widget_style_id]"

      assert_select "input#vote_option_created_by[name=?]", "vote_option[created_by]"

      assert_select "input#vote_option_updated_by[name=?]", "vote_option[updated_by]"
    end
  end
end
