require 'rails_helper'

RSpec.describe "conversations/show", type: :view do
  before(:each) do
    @conversation = assign(:conversation, Conversation.create!(
      :title => "Title",
      :allow_html => false,
      :status => "Status",
      :created_by => 2,
      :updated_by => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
