class MilestonesController < ApplicationController
  respond_to :js, :html

  before_filter :authenticate_user!

  load_and_authorize_resource :project
  load_and_authorize_resource :milestone, :through => :project

  def index
    respond_with @milestones
  end

  def show
    respond_with @milestone
  end

  def new
    respond_with @milestone
  end

  def edit
    respond_with @milestone
  end

  def create
    respond_to do |format|
      if @milestone.save
        format.html { redirect_to settings_milestones_project_path(@project), notice: 'Milestone was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @milestone.update_attributes(params[:milestone])
        format.html { redirect_to settings_milestones_project_path(@project), notice: 'Milestone was successfully updated.' }
        format.js
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @milestone_id = @milestone.id
    @milestone.destroy
    respond_to do |format|
      format.html { redirect_to settings_milestones_project_path(@project), notice: 'Milestone was successfully deleted.' }
      format.js
    end
  end
end
