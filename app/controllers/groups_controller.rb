class GroupsController < ApplicationController
  respond_to :html, :js
  before_filter :authenticate_user!
  load_and_authorize_resource :project
  load_and_authorize_resource :group, :through => :project

  def new
    respond_with @group
  end

  def create
    if @group.save
        respond_with @group
    else
      render 'new'
    end
  end

  def destroy
    @group_id = @group.id
    @group.delete
    respond_to do |format|
      format.html { redirect_to settings_groups_project(@project), :notice => "Group was successfully deleted."}
      format.js
    end
  end

  def edit
    respond_with @group
  end

  def update
    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to settings_groups_project(@project), :notice => "Group was successfully updated."}
        format.js
      else
        render 'edit'
      end
    end
  end
end
