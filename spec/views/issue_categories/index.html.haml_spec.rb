require 'spec_helper'

describe "issue_categories/index" do
  before(:each) do
    assign(:issue_categories, [
      stub_model(IssueCategory,
        :name => "Name"
      ),
      stub_model(IssueCategory,
        :name => "Name"
      )
    ])
  end

  it "renders a list of issue_categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
