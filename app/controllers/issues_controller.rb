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

  def edie
    respond_with @issue
  end

  def create
    respond_to do |format|
      if @issue.save
        format.html { redirect_to [@project, @issue], notice: 'Issue was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @issue.update_attributes(params[:project])
        format.html { redirect_to [@project, @issue], notice: 'Issue was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to @project, notice: 'Issue was successfully deleted.' }
    end
  end
end
