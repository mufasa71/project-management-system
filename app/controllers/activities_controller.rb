class ActivitiesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :add_breadcrumbs
  load_and_authorize_resource :activity, :through => @phase

  respond_to :js, :html
  def index
  end

  def show
    add_breadcrumb @activity.title, project_phase_activity_path(@project, @phase, @activity)
  end

  def new
    respond_with @activity
  end

  def edit
    add_breadcrumb @activity.title, project_phase_activity_path(@project, @phase, @activity)
  end

  def create
    @activity.event.name = @activity.title
    if @activity.save
      respond_with @activity, :location => project_phases_path(:project_id => @project), :notice => "Activity was successfully created."
    else
      render 'new'
    end
  end

  def update
    @activity.event.name = @activity.title
    if @activity.update_attributes(params[:activity])
      flash[:notice] = "Activity was successfully updated."
      respond_with @activity, :location => project_phase_activity_path(@project, @phase, @activity)
    else
      render 'edit'
    end
  end

  def destroy
    @activity.destroy
    redirect_to project_phase_path(@project, @phase), :notice => "Activity was successfully deleted."
  end

  private

  def add_breadcrumbs
    @project = Project.find(params[:project_id])
    @phase = Phase.find(params[:phase_id])
    add_breadcrumb @project.name, project_path(@project)
    add_breadcrumb @phase.title, project_phase_path(@project, @phase)
  end
end

