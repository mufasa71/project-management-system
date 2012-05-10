require 'spec_helper'

describe "issues/edit" do
  before(:each) do
    @issue = assign(:issue, stub_model(Issue,
      :project_id => 1,
      :tracker_id => 1
    ))
  end

  it "renders the edit issue form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => issues_path(@issue), :method => "post" do
      assert_select "input#issue_project_id", :name => "issue[project_id]"
      assert_select "input#issue_tracker_id", :name => "issue[tracker_id]"
    end
  end
end
