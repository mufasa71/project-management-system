class Admin::RolesController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :authenticate_user!
  layout 'admin'
  load_and_authorize_resource

  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.all

    respond_with @roles
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
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
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(params[:role])
    
    respond_to do |format|
      if @role.save
        format.html { redirect_to admin_roles_path, notice: 'Role was successfully created.' }
        format.json { render json: @role, status: :created, location: admin_roles_path }
      else
        format.html { render action: "new" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /roles/1
  # PUT /roles/1.json
  def update
    respond_to do |format|
      if @role.update_attributes(params[:role])
        format.html { redirect_to [:admin, @role], notice: 'Role was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role.destroy
    flash[:notice] = "Role successfully deleted."
    respond_with @role, :location => admin_roles_url
  end

  private
    def check_permissions
      authorize! :all, Role
    end
end
