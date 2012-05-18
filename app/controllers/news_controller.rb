class NewsController < ApplicationController
  before_filter :authenticate_user!

  load_and_authorize_resource :project
  load_and_authorize_resource :news, :through => :project

  def index
    @news = @project.news.page(params[:page]).per(5)
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
  end

  def create
    @news.activity_params = { :news_title => @news.title }
    @news.author = current_user
    respond_to do |format|
      if @news.save
        format.html { redirect_to project_news_index_path(@project), notice: 'News was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @news.attributes = params[:news]
    if @news.changed?
      tmp_params = {}
      @news.changed.each do |field|
        tmp_params.merge! eval(":news_#{field}") => eval("@news.#{field}")
      end
      @news.activity_params = tmp_params
    end
    respond_to do |format|
      if @news.save
        format.html { redirect_to project_news_index_path(@project), notice: 'News was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @news.destroy

    respond_to do |format|
      format.html { redirect_to project_news_index_path(@project), notice: 'News was successfully deleted.' }
    end
  end
end
