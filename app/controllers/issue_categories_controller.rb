class IssueCategoriesController < ApplicationController
  respond_to :html, :xml, :json, :js
  before_filter :authenticate_user!

  load_and_authorize_resource :project
  load_and_authorize_resource :issue_category, :through => :project

  def index
    @issue_categories = IssueCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @issue_categories }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @issue_category }
    end
  end

  def new
    respond_to do |format|
      format.html
      format.js {render 'new'}
    end
  end

  def edit
  end

  def create
    respond_to do |format|
      if @issue_category.save
        format.html { redirect_to new_project_issue_path(params[:project_id]), notice: 'Category was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @issue_category.update_attributes(params[:issue_category])
        format.html { redirect_to @issue_category, notice: 'Issue category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @issue_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @issue_category.destroy
    respond_to do |format|
      format.html { redirect_to issue_categories_url }
      format.json { head :no_content }
    end
  end
end
