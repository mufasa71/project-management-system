class PhasesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :project
  load_and_authorize_resource :phase, :through => :project

  respond_to :js, :html
  def index
    add_breadcrumb "Project -> " << @project.name, project_path(@project)
  end

  def show
    add_breadcrumb "Project -> " << @project.name, project_path(@project)
    add_breadcrumb "Phase -> " << @phase.title, project_phase_path(@project, @phase)
    @activities = @phase.activities
  end

  def new
  end

  def create
    @phase.event.name = @phase.title
    if @phase.save
      redirect_to project_phases_path, :notice => "Phase was successfully created."
    else
      render 'new'
    end
  end

  def update
    @phase.event.name = @phase.title
    if @phase.update_attributes(params[:phase])
      redirect_to project_phases_path, :notice => "Phase was successfully updated."
    else
      render 'edit'
    end
  end

  def edit
    add_breadcrumb "Project -> " << @project.name, project_path(@project)
    add_breadcrumb "Phase -> " << @phase.title, project_phase_path(@project, @phase)
  end

  def destroy
    @phase.destroy
    redirect_to project_phases_path, :notice => "Phase was successfully deleted."
  end

  def sort
    @phases.each do |phase|
      phase.position = params['phase'].index(phase.id.to_s) + 1
      phase.save
    end
    render :nothing => true
  end
end
