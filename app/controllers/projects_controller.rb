class ProjectsController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  def show
    @project.phases.each do |phase|
      if(phase.activities.any? && phase.activities.size == phase.activities_done.size)
        phase.complete = true
      else
        phase.complete = false
      end
      phase.save!
    end
  end

  def new
  end

  def edit
  end

  def create
    @project.event.name = @project.name
    respond_to do |format|
      if @project.save
        if user_signed_in?
          m = @project.members.create(:user => current_user)
        end
        format.html { redirect_to project_project_steps_path(@project) }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @project.event.name = @project.name
    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to settings_information_project_path(@project), notice: 'Project was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  def settings
    @project = Project.find(params[:id])
  end

  def workload
    @project = Project.find(params[:id])
  end
end
