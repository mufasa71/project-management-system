class UsersController < ApplicationController
  respond_to :html, :xml
  before_filter :authenticate_user!
  load_and_authorize_resource

  def show
    respond_with @user
  end

  def following
    @header = "Followed users"
    @user = User.find(params[:id])
    @users = @user.followed_users
    render 'show_follow'
  end

  def followers
    @header = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
end
