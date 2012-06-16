class SettingsController < ApplicationController
  before_filter :load_project

  def information
  end

  def members
    @members = @project.members
  end


  def milestones
    @milestones = @project.milestones
  end

  private

  def load_project
    @project = Project.find(params[:id])
  end
end
