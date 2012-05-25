class RolesController < ApplicationController
  respond_to :html, :js
  before_filter :authenticate_user!

  load_and_authorize_resource :project
  load_and_authorize_resource :role, :through => :project

  def index
    respond_with @roles
  end

  def show
    respond_with @role
  end

  def new
    respond_with @role
  end

  def edit
    respond_with @role
  end

  def create
    respond_to do |format|
      if @role.save
        format.html { redirect_to settings_roles_project_path(@project), notice: 'Role was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @role.update_attributes(params[:role])
        format.html { redirect_to settings_roles_project_path(@project), notice: 'Role was successfully updated.' }
        format.js
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @role_id = @role.id
    @role.destroy

    respond_to do |format|
      format.html { redirect_to settings_roles_project_path(@project), notice: 'Role was successfully deleted.' }
      format.js
    end
  end
end
