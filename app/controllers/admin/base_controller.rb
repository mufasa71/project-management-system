module Admin
  class BaseController < ApplicationController
    layout 'admin'
    before_filter :verify_admin

    private 

    def verify_admin
      redirect_to root_url, :notice => "You are not authorized to access this page."  unless current_user.admin?
    end
  end
end
