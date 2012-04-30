class UsersController < ApplicationController
  respond_to :html, :xml
  before_filter :authenticate_user!
  load_and_authorize_resource

  def show
    respond_with @user
  end

  def following
    @user = User.find(params[:id])
    @following = @user.followed_users
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
  end
end
