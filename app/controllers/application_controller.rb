class ApplicationController < ActionController::Base
  before_filter :define_current_user

  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def define_current_user
    User.current_user = current_user
  end
end
