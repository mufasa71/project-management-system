require 'spec_helper'

describe "members/edit" do
  before(:each) do
    @member = assign(:member, stub_model(Member,
      :user_id => 1,
      :project_id => 1
    ))
  end

  it "renders the edit member form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => members_path(@member), :method => "post" do
      assert_select "input#member_user_id", :name => "member[user_id]"
      assert_select "input#member_project_id", :name => "member[project_id]"
    end
  end
end
