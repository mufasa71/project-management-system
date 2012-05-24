class MembersController < ApplicationController
  respond_to :html

  before_filter :authenticate_user!
  load_and_authorize_resource :project
  load_and_authorize_resource :group, :through => :project

  def index
    @users = User.find(:all, :conditions => ['id not in (?)', @project.members.map(&:user_id)])
    @groups = Group.where(:project_id => params[:project_id])
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def edit
  end

  def create
    params[:group][:user_ids].each do |user_id|
      @group.members << Member.new(:user_id => user_id)
    end
    redirect_to settings_members_project_path(@project), :notice => "Successful updated."
  end

  def update
    respond_to do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to settings_members_project_path(:id => @member.project_id), notice: 'Successful updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to settings_members_project_path(@project), :notice => "Successful updated." }
    end
  end
end
