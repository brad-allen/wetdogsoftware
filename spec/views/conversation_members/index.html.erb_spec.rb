require 'rails_helper'

RSpec.describe "conversation_members/index", type: :view do
  before(:each) do
    assign(:conversation_members, [
      ConversationMember.create!(
        :conversation => nil,
        :profile => nil,
        :status => "Status",
        :created_by => 2,
        :updated_by => 3
      ),
      ConversationMember.create!(
        :conversation => nil,
        :profile => nil,
        :status => "Status",
        :created_by => 2,
        :updated_by => 3
      )
    ])
  end

  it "renders a list of conversation_members" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
