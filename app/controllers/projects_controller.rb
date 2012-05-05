class ProjectsController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  def show
    respond_with @project
  end

  def new
    respond_with @project
  end

  def edit
    respond_with @project
  end

  def create
    respond_to do |format|
      if @project.save
        if user_signed_in?
          r = Role.first == nil ? Role.create(:name => "Manager") : Role.first
          m = Member.new(:user => current_user, :roles => [r])
          @project.members << m
        end
        format.html { redirect_to @project, notice: 'Successful creation.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Successful update.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  def settings
    @project = Project.find(params[:id])
  end
end
