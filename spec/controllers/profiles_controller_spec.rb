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
    @profile = FactoryGirl.create(:profile, :user_id => subject.current_user)
    @user_id = subject.current_user.id
  end

  describe "GET show" do
    it "assigns the requested profile as @profile" do
      get :show, {:id => @profile.to_param, :user_id => @user_id}
      assigns(:profile).should eq(@profile)
    end
  end

  describe "GET new" do
    it "assigns a new profile as @profile" do
      get:new, {:user_id => @user_id}
      assigns(:profile).should be_a_new(Profile)
    end
  end

  describe "GET edit" do
    it "assigns the requested profile as @profile" do
      get :edit, {:id => @profile.to_param, :user_id => @user_id}
      assigns(:profile).should eq(@profile)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested profile" do
        Profile.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => @profile.to_param, :user_id => @user_id, :profile => {'these' => 'params'}}
      end
        
      it "assigns the requested profile as @profile" do
        put :update, {:id => @profile.to_param, :user_id => @user_id, :profile => valid_attributes}
        assigns(:profile).should eq(@profile)
      end

      it "redirects to the user" do
        put :update, {:id => @profile.to_param, :user_id => @user_id, :profile => valid_attributes}
        response.should redirect_to user_path(subject.current_user)
      end
    end

    describe "with invalid params" do
      it "assigns the profile as @profile" do
        Profile.any_instance.stub(:save).and_return(false)
        put :update, {:profile => @profile.to_param, :user_id => @user_id, :profile => {}}
        assigns(:profile).should eq(@profile)
      end
      it "re-renders the 'edit' template" do
        Profile.any_instance.stub(:save).and_return(false)
        put :update, {:profile => @profile.to_param, :user_id => @user_id, :profile => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Profile" do
        expect{
          post :create, {:profile => valid_attributes, :user_id => @user_id}
        }.to change(Profile, :count).by(1)
      end
      it "assigns a newly created profile as @profile" do
        post :create, {:profile => valid_attributes, :user_id => @user_id}
        assigns(:profile).should be_a(Profile)
        assigns(:profile).should be_persisted
      end
      it "redirects to the user's page" do
        post :create, {:profile => valid_attributes, :user_id => @user_id}
        response.should redirect_to user_path(subject.current_user)
      end
    end
    describe "with invalid params" do
      it "assigns a newly created but unsaves profile as @profile" do
        Profile.any_instance.stub(:save).and_return(false)
        post :create, {:profile => {}, :user_id => @user_id}
        assigns(:profile).should be_a_new(Profile)
      end

      it "re-renders the 'new' template" do
        Profile.any_instance.stub(:save).and_return(false)
        post :create, {:profile => {}, :user_id => @user_id}
        response.should render_template("new")
      end
    end
  end
end
