class ActivitiesController < ApplicationController
  def index
    @project = Project.find(params[:id])
    @issues = @project.issues.sort_by{|value| -value.updated_at.to_i}
  end
end
