class SettingsController < ApplicationController
  before_filter :load_project

  def information
  end

  def members
    @members = @project.members
  end

  def issue_categories
  end

  def activities
  end

  def groups
    @groups = @project.groups
  end

  def roles
    @roles = @project.roles
  end

  def milestones
    @milestones = @project.milestones
  end

  private

  def load_project
    @project = Project.find(params[:id])
  end
end
