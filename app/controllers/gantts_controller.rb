class GanttsController < ApplicationController
  before_filter :authenticate_user!

  load_and_authorize_resource :project

  def show
  end
end
