require 'spec_helper'

describe "profiles/index" do
  before(:each) do
    assign(:profiles, [
      stub_model(Profile,
        :username => "Username",
        :skype => "Skype"
      ),
      stub_model(Profile,
        :username => "Username",
        :skype => "Skype"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Skype".to_s, :count => 2
  end
end
