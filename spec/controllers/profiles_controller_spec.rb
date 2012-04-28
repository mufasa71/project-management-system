require 'spec_helper'

describe ProfilesController do

  # This should return the minimal set of attributes required to create a valid
  # Profile. As you add validations to Profile, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { :username => "Shukhrat Mukimov", :skype => "skype" }
  end
  
  login_user

  before(:each) do
    @profile = FactoryGirl.create(:profile)
  end

  describe "GET show" do
    it "assigns the requested profile as @profile" do
      get :show, {:id => @profile.to_param}
      assigns(:profile).should eq(@profile)
    end
  end

  describe "GET edit" do
    it "assigns the requested profile as @profile" do
      get :edit, {:id => @profile.to_param}
      assigns(:profile).should eq(@profile)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "assigns the requested profile as @profile" do
        put :update, {:id => @profile.to_param, :profile => valid_attributes}
        assigns(:profile).should eq(@profile)
      end

      it "redirects to the user" do
        put :update, {:id => @profile.to_param, :profile => valid_attributes}
        response.should redirect_to root_path
      end
    end
  end
end
