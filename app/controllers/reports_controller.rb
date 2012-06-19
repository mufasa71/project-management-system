class ReportsController < ApplicationController
  before_filter :authenticate_user!

  load_and_authorize_resource :project
  load_and_authorize_resource :report, :through => :project

  respond_to :js, :html

  def index
  end

  def new
    respond_with @report
  end

  def create
    @report.prepared_by = current_user.name
    @report.activities = []
    @project.phases.each do |phase|
      @report.activities << phase.activities_in_progress.to_a
    end
    if @report.save
      respond_with @report, :location => project_reports_path(@project)
    else
      render 'new'
    end
  end

  def destroy
    @report_id = @report.id
    @report.destroy
    respond_to do |format|
      format.js
    end
  end
end
