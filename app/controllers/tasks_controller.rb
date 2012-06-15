class TasksController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :project
  load_and_authorize_resource :phase, :through => :project
  load_and_authorize_resource :activity, :through => :phase
  load_and_authorize_resource :task, :through => :activity
  respond_to :html
  
  def index
  end

  def show
  end

  def new
    @task.attachments.build
  end

  def edit
  end

  def create
    respond_to do |format|
      if @task.save
        format.html { redirect_to project_phase_activity_tasks(@project, @phase, @activity, @task), notice: 'Task was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to [@project, @task], notice: 'Task was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to @project, notice: 'Issue was successfully deleted.' }
    end
  end
end
