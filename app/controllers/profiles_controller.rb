class ProfilesController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :authenticate_user!
  load_and_authorize_resource :user
  load_and_authorize_resource :profile, :through => :user, :singleton => true

  def show
    respond_with @profile
  end

  def edit
    respond_with @profile
  end

  def update
    if @profile.update_attributes(params[:profile]) 
      flash[:notice] = 'Profile was successfully updated.'
      respond_with(@profile, :location => user_path(current_user), :status => :created) do |format|
        format.html { redirect_to user_path(current_user) }
      end
    else
      respond_with(@profile.errors, :status => :unprocessable_entry) do |format|
        format.html { render :action => :edit }
      end
    end
  end

  def new
  end

  def create
    if @profile.save
      flash[:notice] = "Profile was successfully created."
      respond_with(@profile, :location => user_path(current_user), :status => :created) do |format|
        format.html {redirect_to user_path(current_user)}
      end
    else
      respond_with(@profile.errors, :status => :unprocessable_entry) do |format|
        format.html { render :action => :new }
      end
    end
  end
end
