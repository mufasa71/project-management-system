class FriendsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @friendship_from = Friendship.new(:user_id => params[:user_id], :friend_id => params[:friend_id], :status => Friendship::REQUESTED)
    @friendship_to = Friendship.new(:user_id => params[:friend_id], :friend_id => params[:user_id], :status => Friendship::PENDING)
    
    if @friendship_from.save && @friendship_to.save
      flash[:notice] = "Friend request was successfully sended."
    else
      flash[:alert] = "Something went wrong, please try again latter."
    end
    redirect_to user_path(params[:friend_id])
  end
end
