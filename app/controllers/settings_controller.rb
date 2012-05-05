class SettingsController < ApplicationController
  def information
    @project = Project.find(params[:id])
  end

  def members
    @project = Project.find(params[:id])
  end
end
