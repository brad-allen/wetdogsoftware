require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        :conversation => nil,
        :profile => nil,
        :content => "Content",
        :status => "Status",
        :created_by => 2,
        :updated_by => 3
      ),
      Message.create!(
        :conversation => nil,
        :profile => nil,
        :content => "Content",
        :status => "Status",
        :created_by => 2,
        :updated_by => 3
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
