require 'rails_helper'

RSpec.describe "vote_options/show", type: :view do
  before(:each) do
    @vote_option = assign(:vote_option, VoteOption.create!(
      :name => "Name",
      :description => "Description",
      :value => 2,
      :image => "Image",
      :widget_style => nil,
      :created_by => 3,
      :updated_by => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(//)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
