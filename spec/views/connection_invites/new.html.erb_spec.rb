require 'rails_helper'

RSpec.describe "connection_invites/new", type: :view do
  before(:each) do
    assign(:connection_invite, ConnectionInvite.new(
      :profile => nil,
      :connection_profile => nil,
      :status => "MyString",
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders new connection_invite form" do
    render

    assert_select "form[action=?][method=?]", connection_invites_path, "post" do

      assert_select "input#connection_invite_profile_id[name=?]", "connection_invite[profile_id]"

      assert_select "input#connection_invite_connection_profile_id[name=?]", "connection_invite[connection_profile_id]"

      assert_select "input#connection_invite_status[name=?]", "connection_invite[status]"

      assert_select "input#connection_invite_created_by[name=?]", "connection_invite[created_by]"

      assert_select "input#connection_invite_updated_by[name=?]", "connection_invite[updated_by]"
    end
  end
end
