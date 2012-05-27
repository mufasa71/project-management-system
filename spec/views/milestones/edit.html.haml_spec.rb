require 'spec_helper'

describe "milestones/edit" do
  before(:each) do
    @milestone = assign(:milestone, stub_model(Milestone,
      :description => "MyString",
      :issue_id => 1
    ))
  end

  it "renders the edit milestone form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => milestones_path(@milestone), :method => "post" do
      assert_select "input#milestone_description", :name => "milestone[description]"
      assert_select "input#milestone_issue_id", :name => "milestone[issue_id]"
    end
  end
end
