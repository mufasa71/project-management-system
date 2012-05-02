require 'spec_helper'

describe UsersHelper do
  before(:each) do
    @user = FactoryGirl.create(:unique_user)
    self.stub!(:current_user).and_return(@user)
  end

  describe "for signed-in users" do
    let(:other_user) { FactoryGirl.create(:unique_user) }

    it "should render follow button" do
      self.stub!(:render).and_return("Follow")
      follow_button_for(other_user).should eq("Follow")
    end

    it "should render unfollow button" do
      @user.follow!(other_user)
      self.stub!(:render).and_return("Unfollow")
      follow_button_for(other_user).should eq("Unfollow")
    end
  end
end
