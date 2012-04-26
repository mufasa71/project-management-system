class Admin::RolesController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :authenticate_user!
  layout 'admin'
  before_filter :check_permissions

  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.all

    respond_with @roles
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
    @role = Role.find(params[:id])
    respond_with @role
  end

  # GET /roles/new
  # GET /roles/new.json
  def new
    @role = Role.new
    respond_with @role
  end

  # GET /roles/1/edit
  def edit
    @role = Role.find(params[:id])
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(params[:role])
    if @role.save
      flash[:notice] = 'Role was successfully created.' 
    end
    respond_with @role, :location => admin_role_path(@role)
  end

  # PUT /roles/1
  # PUT /roles/1.json
  def update
    @role = Role.find(params[:id])
    if @role.update_attributes(params[:role])
      flash[:notice] = 'Role was successfully updated.'
    end
    respond_with @role, :location => admin_role_path(@role)
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    respond_with @role, :location => admin_roles_url
  end

  private
    def check_permissions
      authorize! :all, Role
    end
end
