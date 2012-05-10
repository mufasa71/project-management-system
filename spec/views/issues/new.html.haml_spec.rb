require 'spec_helper'

describe "issues/new" do
  before(:each) do
    assign(:issue, stub_model(Issue,
      :project_id => 1,
      :tracker_id => 1
    ).as_new_record)
  end

  it "renders new issue form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => issues_path, :method => "post" do
      assert_select "input#issue_project_id", :name => "issue[project_id]"
      assert_select "input#issue_tracker_id", :name => "issue[tracker_id]"
    end
  end
end
