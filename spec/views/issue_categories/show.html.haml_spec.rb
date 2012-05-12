require 'spec_helper'

describe "issue_categories/show" do
  before(:each) do
    @issue_category = assign(:issue_category, stub_model(IssueCategory,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
