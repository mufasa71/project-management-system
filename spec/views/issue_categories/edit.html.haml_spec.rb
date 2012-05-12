require 'spec_helper'

describe "issue_categories/edit" do
  before(:each) do
    @issue_category = assign(:issue_category, stub_model(IssueCategory,
      :name => "MyString"
    ))
  end

  it "renders the edit issue_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => issue_categories_path(@issue_category), :method => "post" do
      assert_select "input#issue_category_name", :name => "issue_category[name]"
    end
  end
end
