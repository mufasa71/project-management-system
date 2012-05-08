class UsersController < ApplicationController
  respond_to :html, :xml
  before_filter :authenticate_user!
  before_filter :find_user
  
  authorize_resource

  def show
    respond_with @user
  end

  def following
    @header = "Followed users"
    @users = @user.followed_users
    render 'show_follow'
  end

  def followers
    @header = "Followers"
    @users = @user.followers
    render 'show_follow'
  end

  def details
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to details_user_path(@user), :notice => "Details successful updated."
    else
      redirect_to root_path, :alert => "Something went wrong, please try later."
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
