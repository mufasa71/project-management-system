require 'spec_helper'

describe "milestones/new" do
  before(:each) do
    assign(:milestone, stub_model(Milestone,
      :description => "MyString",
      :issue_id => 1
    ).as_new_record)
  end

  it "renders new milestone form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => milestones_path, :method => "post" do
      assert_select "input#milestone_description", :name => "milestone[description]"
      assert_select "input#milestone_issue_id", :name => "milestone[issue_id]"
    end
  end
end
