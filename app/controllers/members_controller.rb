class MembersController < ApplicationController
  respond_to :html, :xml

  def index
    @project = Project.find_by_id(params[:project_id])
    @users = User.find(:all, :conditions => ['id not in (?)', @project.members.map(&:user_id)])
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
  end

  def create
    @project = Project.find(params[:project_id])
    params[:project][:user_ids].each do |user_id|
      @project.members << Member.new(:user_id => user_id)
    end
    redirect_to settings_members_project_path(@project), :notice => "Successful updated."
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to settings_members_project_path(:id => @member.project_id), notice: 'Successful updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to settings_members_project_path(@project), :notice => "Successful updated." }
      format.json { head :no_content }
    end
  end
end
