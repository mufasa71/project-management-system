class AttachmentsController < ApplicationController
  before_filter :authenticate_user!

  load_and_authorize_resource :project
  load_and_authorize_resource :attachment, :through => :project

  def index
  end

  def new
  end

  def create
    @project = Project.find(params[:project_id])
    @project.attributes = params[:project]
    if @project.save
      redirect_to project_attachments_path(@project), :notice => "File was successfully added."
    else
      render 'new'
    end
  end

  def update
    if @attachment.update_attributes(params[:attachment])
      redirect_to @attachment, :notice  => "File was successfully updated."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @attachment.remove_file!
    @attachment.destroy
    redirect_to project_attachments_path(@project), :notice => "File was successfully deleted."
  end
end
