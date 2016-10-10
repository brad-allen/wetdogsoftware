require 'rails_helper'

RSpec.describe "vote_options/index", type: :view do
  before(:each) do
    assign(:vote_options, [
      VoteOption.create!(
        :name => "Name",
        :description => "Description",
        :value => 2,
        :image => "Image",
        :widget_style => nil,
        :created_by => 3,
        :updated_by => 4
      ),
      VoteOption.create!(
        :name => "Name",
        :description => "Description",
        :value => 2,
        :image => "Image",
        :widget_style => nil,
        :created_by => 3,
        :updated_by => 4
      )
    ])
  end

  it "renders a list of vote_options" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
