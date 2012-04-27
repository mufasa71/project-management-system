class Admin::UsersController < ApplicationController
  respond_to :html, :xml
  before_filter :authenticate_user!
  
  load_and_authorize_resource

  layout 'admin'

  def index
    @users = User.not_admins
    respond_with @users
  end

  def show
    respond_with @user
  end
  
  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "User successfully updated."
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  def destroy
    if @user.destroy
      flash[:notice] = "User successfully deleted."
    else
      flash[:alert] = "Sorry, but can not delete user."
    end

    redirect_to admin_users_path
  end
end
