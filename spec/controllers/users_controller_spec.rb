require 'spec_helper'

describe UsersController do
  login_user

  it "should have a current user" do
    subject.current_user.should_not be_nil
  end

  describe "GET 'show'" do
    before(:each) do
      @user = FactoryGirl.create(:unique_user)
    end

    it "returns http success" do
      get 'show', {:id => @user.to_param }
      response.should be_success
    end
    it "assigns @user" do
      get 'show', {:id => @user.to_param }
      assigns(:user).should eq(@user)
    end
  end

  describe "GET 'followers/following'" do
    before(:each) { @user = FactoryGirl.create(:unique_user) }

    describe "GET 'following'" do
      before(:each) do
        @user.follow!(FactoryGirl.create(:unique_user))
        get 'following', {:id => @user.to_param}
      end

      subject { response }

      it { should be_success }
      it { assigns(:users).should eq(@user.followed_users) }
    end

    describe "GET 'followers'" do
      before(:each) do
        FactoryGirl.create(:unique_user).follow!(@user)
        get 'followers', {:id => @user.to_param}
      end

      subject { response }

      it { should be_success }
      it { assigns(:users).should eq(@user.followers) }
    end
  end
end
