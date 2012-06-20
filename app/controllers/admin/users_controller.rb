module Admin
  class UsersController < BaseController
    respond_to :html, :xml
    before_filter :authenticate_user!


    def index
      @users = User.all
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
      unless @user == current_user 
        if @user.destroy
          flash[:notice] = "User successfully deleted."
        else
          flash[:alert] = @user.errors[:base][0].to_s
        end
      else
        flash[:alert] = "Sorry, but you can not delete yourself."
      end
      redirect_to admin_users_path
    end
  end
end
