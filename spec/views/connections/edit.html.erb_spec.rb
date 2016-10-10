require 'rails_helper'

RSpec.describe "connections/edit", type: :view do
  before(:each) do
    @connection = assign(:connection, Connection.create!(
      :profile => nil,
      :connection_profile => nil,
      :status => "MyString",
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders the edit connection form" do
    render

    assert_select "form[action=?][method=?]", connection_path(@connection), "post" do

      assert_select "input#connection_profile_id[name=?]", "connection[profile_id]"

      assert_select "input#connection_connection_profile_id[name=?]", "connection[connection_profile_id]"

      assert_select "input#connection_status[name=?]", "connection[status]"

      assert_select "input#connection_created_by[name=?]", "connection[created_by]"

      assert_select "input#connection_updated_by[name=?]", "connection[updated_by]"
    end
  end
end
