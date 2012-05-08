module Admin
  class UsersController < BaseController
    respond_to :html, :xml
    before_filter :authenticate_user!


    def index
      @users = User.not_admins
      respond_with @users
    end

    def show
      @user = User.find(params[:id])
      respond_with @user
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        flash[:notice] = "User successfully updated."
        redirect_to admin_users_path
      else
        render 'edit'
      end
    end

    def destroy
      @user = User.find(params[:id])
      if @user.destroy
        flash[:notice] = "User successfully deleted."
      else
        flash[:alert] = "Sorry, but can not delete user."
      end
      redirect_to admin_users_path
    end
  end
end
