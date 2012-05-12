require 'spec_helper'

describe "issue_categories/new" do
  before(:each) do
    assign(:issue_category, stub_model(IssueCategory,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new issue_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => issue_categories_path, :method => "post" do
      assert_select "input#issue_category_name", :name => "issue_category[name]"
    end
  end
end
