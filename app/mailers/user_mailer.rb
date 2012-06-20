class UserMailer < ActionMailer::Base
  default from: "diamondsax@gmail.com"

  def try_mail(user)
    @user = user
    mail(:to => user.email, :subject => "This message was sent from rails app.")
  end
end
