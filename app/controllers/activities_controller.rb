class ActivitiesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :add_breadcrumbs
  load_and_authorize_resource :phase
  load_and_authorize_resource :activity, :through => :phase

  respond_to :html
  def index
  end

  def show
    add_breadcrumb "Activity -> " << @activity.title, project_phase_activity_path(@project, @phase, @activity)
  end

  def new
    respond_with @activity
  end

  def edit
    add_breadcrumb "Activity -> " << @activity.title, project_phase_activity_path(@project, @phase, @activity)
  end

  def create
    @activity.event.name = @activity.title
    if @activity.save
      redirect_to project_phase_activity_path(@project, @phase, @activity), :notice => "Activity was successfully created."
    else
      render 'new'
    end
  end

  def update
    @activity.event.name = @activity.title
    if @activity.update_attributes(params[:activity])
      redirect_to project_phase_activity_path(@project, @phase, @activity), :notice => "Activity was successfully updated."
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
    add_breadcrumb "Project -> " << @project.name, project_path(@project)
    add_breadcrumb "Phase -> " << @phase.title, project_phase_path(@project, @phase)
  end
end
