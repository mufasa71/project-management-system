require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = FactoryGirl.create(:user, email: "mukimov@gmail.com") 
    sign_in @user
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/mukimov@gmail.com/)
  end

  describe "for signed-in users" do
    let(:other_user) { FactoryGirl.create(:unique_user) }

    describe "follower/following counts" do
      before do
        other_user.follow!(@user)
      end

      it "should have link 0 following" do
        render
        rendered.should have_link("0 following", href: following_user_path(@user))
      end
      it "should have link 1 following" do
        render
        rendered.should have_link("1 follower" , href: followers_user_path(@user))
      end
    end
  end
end
