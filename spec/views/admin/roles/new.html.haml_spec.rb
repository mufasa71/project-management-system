require 'spec_helper'

describe "admin/roles/new" do
  before(:each) do
    assign(:role, stub_model(Role,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new role form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_roles_path, :method => "post" do
      assert_select "input#role_name", :name => "role[name]"
    end
  end
end
