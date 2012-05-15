class ActivitiesController < ApplicationController
  def index
    @project = Project.find(params[:id])
    #@issues = @project.activities.where(:trackable_type => "Issue").sort_by{|value| -value.created_at.to_i}
  end
end
