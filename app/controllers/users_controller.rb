class UsersController < ApplicationController
  respond_to :html, :xml
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    respond_with @user
  end
end
