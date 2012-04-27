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
end
