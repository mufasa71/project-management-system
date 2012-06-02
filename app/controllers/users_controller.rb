class UsersController < ApplicationController
  respond_to :html, :js
  before_filter :authenticate_user!, :except => :index
  before_filter :find_user, :except => :index
  
  respond_to :js, :html
  authorize_resource


  def index
    @users = User.search(params[:search]).order(:name).page(params[:page]).per(10)
    respond_with @users
  end

  def show
    respond_with @user
  end

  def following
    @header = "Followed users"
    @users = @user.followed_users
    render 'show_follow'
  end

  def followers
    @header = "Followers"
    @users = @user.followers
    render 'show_follow'
  end

  def details
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to details_user_path(@user), :notice => "Details successful updated."
    else
      redirect_to root_path, :alert => "Something went wrong, please try later."
    end
  end

  def send_message
    if request.get?
      @message = Message.new
      respond_with @message do |format|
        format.js { render :template => '/users/new_message' }
      end
    else
      @message = Message.new(params[:message])
      @message.recipients << User.find(params[:id])
      @message.sender = current_user
      if @message.conversation_id
        @conversation = Conversation.find(@message.conversation_id)
        unless @conversation.is_participant?(current_user)
          flash[:alert] = "You do not have permission to view that conversation."
          return redirect_to root_path
        end
        receipt = current_user.reply_to_conversation(@conversation, @message.body, nil, true, true, @message.attachment)
      else
        unless @message.valid?
          return render :new
        end
        receipt = current_user.send_message(@message.recipients, @message.body, @message.subject, true, @message.attachment)
      end
      respond_with receipt do |format|
        format.js { render :template => '/users/send_message' }
      end
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

end
