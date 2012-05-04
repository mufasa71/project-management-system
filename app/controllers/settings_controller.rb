class SettingsController < ApplicationController
  def information
    @project = Project.find(params[:id])
    render 'projects/settings'
  end

  def members
    @project = Project.find(params[:id])
    render 'projects/settings'
  end
end
