class MembersController < ApplicationController
  respond_to :html, :js

  before_filter :authenticate_user!
  load_and_authorize_resource :project
  load_and_authorize_resource :member, :through => :project

  def index
    @users = User.find(:all, :conditions => ['id not in (?) and admin="f"', @project.members.map(&:user_id)])
    respond_with @users
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def edit
    respond_with @member
  end

  def create
    params[:project][:user_ids].each do |user_id|
      @project.members << Member.new(:user_id => user_id)
    end
    redirect_to settings_members_project_path(@project), :notice => "Successful updated."
  end

  def update
    respond_to do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to settings_members_project_path(:id => @member.project_id), notice: 'Successful updated.' }
        format.js
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @member_id = @member.id
    if @member.destroy
      flash[:notice] = "Member was successfully deleted."
    else
      flash[:notice] = @member.errors[:base][0].to_s
    end
    respond_with @member, :location => settings_members_project_path(@project)
  end
end
