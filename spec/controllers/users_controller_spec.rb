require 'spec_helper'

describe UsersController do
  login_admin

  it "should have a current user" do
    subject.current_user.should_not be_nil
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
    it "assigns @users" do
      user = FactoryGirl.create(:user)
      get 'index'
      assigns(:users).should include(user)
    end
  end
end
