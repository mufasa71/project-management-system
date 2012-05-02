class RelationshipsController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource

  def create
    begin
      @user = User.find(params[:relationship][:followed_id])
      current_user.follow!(@user)
      flash[:notice] = "You are now following #{@user.email}"
      redirect_to @user
    rescue
      flash[:alert] = "Something went wrong, please try again later."
      redirect_to root_path
    end
  end

  def destroy
    begin 
      @user = Relationship.find(params[:id]).followed
      current_user.unfollow!(@user)
      flash[:notice] = "You successfully unfollowed #{@user.email}"
      redirect_to @user
    rescue
      flash[:alert] = "Something went wrong, please try again later."
      redirect_to root_path
    end
  end
end
