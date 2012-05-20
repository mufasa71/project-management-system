class IssuesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :project
  load_and_authorize_resource :issue, :through => :project
  respond_to :xml, :html
  
  def index
    respond_with @issues
  end

  def show
    @activities = @issue.activities.sort_by{|value| -value.created_at.to_i}.take(5)
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
    @issue.activity_params = { :issue_subject => @issue.subject }
    respond_to do |format|
      if @issue.save
        format.html { redirect_to [@project, @issue], notice: 'Issue was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @issue.attributes = params[:issue]
    if @issue.changed?
      tmp_params = {}
      @issue.changed.each do |field|
        tmp_params.merge! eval(":issue_#{field}") => eval("@issue.#{field}")
      end
      @issue.activity_params = tmp_params
    end

    respond_to do |format|
      if @issue.save
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
