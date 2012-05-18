class CommentsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :news
  load_and_authorize_resource :comment, :through => :news

  def destroy
  end

  def create
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to project_news_path(:project_id => params[:project_id], :id => @news), :notice => "Comment was successfully created."}
      else
        redirect_to project_news_path(:project_id => params[:project_id], :id => @news), :alert => "Comment not saved. Please try later."
      end
    end
  end
end
