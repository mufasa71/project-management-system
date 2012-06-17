class GanttsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @project = Project.find(params[:project_id])
    @phase = Phase.find(params[:phase_id]) if params[:phase_id]
  end
end
