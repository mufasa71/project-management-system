class UserMailer < ActionMailer::Base
  include Resque::Mailer  
  default from: "diamondsax@gmail.com"

  def try_mail(user_id)
    @user = User.find(user_id)
    mail(:to => @user.email, :subject => "This message was sent from rails app.")
  end
end
