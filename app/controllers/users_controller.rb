class UsersController < ApplicationController
  respond_to :html, :xml

  def index
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
    respond_with @user
  end

  def destroy
  end

  def update
  end

  def create
  end

  def new
  end
end
