class ProfilesController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :authenticate_user!
  load_and_authorize_resource 

  def index
    @profiles = Profile.all
    respond_with @profiles
  end

  def show
    respond_with @profile
  end

  def edit
  end

  def update
    current_user.getting_started = false
    
    if @profile.update_attributes(params[:profile]) && current_user.save
      flash[:notice] = 'Profile was successfully updated.'
    end

    respond_with @profile, :location => root_path
  end
end
