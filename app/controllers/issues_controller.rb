class IssuesController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource :project
  load_and_authorize_resource :issue, :through => :project
  respond_to :xml, :html
  
  def index
    respond_with @issues
  end

  def show
    respond_with @issue
  end

  def new
    @issue.attachments.build
    respond_with @issue
  end

  def edit
    respond_with @issue
  end

  def create
    @issue.author_id = current_user.id

    respond_to do |format|
      if @issue.save
        format.html { redirect_to [@project, @issue], notice: 'Issue was successfully created.' }
        format.json { render json: @issue, status: :created, location: @issue }
      else
        format.html { render action: "new" }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @issue.update_attributes(params[:issue])
        format.html { redirect_to [@project, @issue], notice: 'Successful updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to @project, notice: 'Successful deleted.' }
    end
  end
end
