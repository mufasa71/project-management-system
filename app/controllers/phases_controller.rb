class PhasesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :project
  load_and_authorize_resource :phase, :through => :project

  respond_to :js, :html

  def index
  end

  def show
    respond_with @phase
  end

  def new
  end

  def create
    if @phase.save
      redirect_to project_phases_path, :notice => "Phase was successfully created."
    else
      render 'new'
    end
  end

  def update
    if @phase.update_attributes(params[:phase])
      redirect_to project_phases_path, :notice => "Phase was successfully updated."
    else
      render 'edit'
    end
  end

  def edit
  end

  def destroy
    @phase.delete
    redirect_to project_phases_path, :notice => "Phase was successfully deleted."
  end
end