require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = FactoryGirl.create(:user, email: "mukimov@gmail.com") 
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/mukimov@gmail.com/)
  end
end
