class SettingsController < ApplicationController
  before_filter :load_project

  def information
  end

  def members
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

  private

  def load_project
    @project = Project.find(params[:id])
  end
end
