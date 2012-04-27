require 'spec_helper'

describe Admin::UsersController do
# This should return the minimal set of attributes required to create a valid
  # user. As you add validations to user, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { :email => "student@email.com" }
  end
  
  login_admin

  before(:each) do
    @user = FactoryGirl.create(:unique_user)
  end

  describe "GET index" do
    it "assigns all users as @users" do
      get :index
      assigns(:users).should eq([@user])
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      get :show, {:id => @user.to_param}
      assigns(:user).should eq(@user)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      get :edit, {:id => @user.to_param}
      assigns(:user).should eq(@user)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user" do
        # Assuming there are no other users in the database, this
        # specifies that the user created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        User.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => @user.to_param, :user => {'these' => 'params'}}
      end

      it "assigns the requested user as @user" do
        put :update, {:id => @user.to_param, :user => valid_attributes}
        assigns(:user).should eq(@user)
      end

      it "redirects to the user" do
        put :update, {:id => @user.to_param, :user => valid_attributes}
        response.should redirect_to admin_users_path
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, {:id => @user.to_param, :user => {}}
        assigns(:user).should eq(@user)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, {:id => @user.to_param, :user => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user" do
      expect {
        delete :destroy, {:id => @user.to_param}
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      delete :destroy, {:id => @user.to_param}
      response.should redirect_to(admin_users_url)
    end
  end
end
