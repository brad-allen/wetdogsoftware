require 'rails_helper'

RSpec.describe "conversation_members/show", type: :view do
  before(:each) do
    @conversation_member = assign(:conversation_member, ConversationMember.create!(
      :conversation => nil,
      :profile => nil,
      :status => "Status",
      :created_by => 2,
      :updated_by => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
