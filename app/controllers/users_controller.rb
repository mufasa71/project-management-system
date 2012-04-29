class UsersController < ApplicationController
  respond_to :html, :xml
  before_filter :authenticate_user!
  load_and_authorize_resource :only => :show

  def show
    @user = User.find(params[:id])
    respond_with @user
  end
end
