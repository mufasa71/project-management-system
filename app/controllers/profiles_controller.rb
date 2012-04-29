class ProfilesController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :authenticate_user!
  load_and_authorize_resource 
  skip_load_resource :only => [:new, :update]

  def show
    respond_with @profile
  end

  def edit
  end

  def update
    @profile = Profile.find_by_user_id(params[:user_id])

    current_user.getting_started = false
    
    if @profile.update_attributes(params[:profile]) && current_user.save
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
    @profile = current_user.build_profile
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
