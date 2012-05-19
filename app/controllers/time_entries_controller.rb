class TimeEntriesController < ApplicationController
  respond_to :js, :html
  before_filter :authenticate_user!

  load_and_authorize_resource :issue
  load_and_authorize_resource :time_entry, :through => :issue

  def new
    respond_with @time_entry
  end

  def create
    @time_entry.project = @issue.project
    @time_entry.user = current_user
    @time_entry.spent_on = Time.now
    if @time_entry.save
      respond_with @time_entry
    else
      render 'new'
    end
  end
end
