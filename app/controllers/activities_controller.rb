class ActivitiesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :project
  load_and_authorize_resource :phase
  load_and_authorize_resource :activity, :through => :phase

  respond_to :js, :html
  def index
  end

  def show
  end

  def new
    respond_with @activity
  end

  def edit
  end

  def create
    if @activity.save
      respond_with @activity, :location => project_phases_path(:project_id => @project), :notice => "Activity was successfully created."
    else
      render 'new'
    end
  end
end

