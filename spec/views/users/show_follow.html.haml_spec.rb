require 'spec_helper'
describe "users/show_follow" do

  before(:each) do
    assign(:users, [])
  end

  subject { rendered }
  
  describe "should render 'Followers'" do
    before do 
      assign(:header, "Followers")
      render
    end
    it { should have_selector('h3', text: 'Followers') }
  end

  describe "should render 'Followed users'" do
    before do
      assign(:header, "Followed users") 
      render
    end
    it { should have_selector("h3", text: "Followed users") }
  end
end
