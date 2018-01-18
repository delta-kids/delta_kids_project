class UserMailer < ApplicationMailer
  default from: 'coordinator@deltakids.ca'

  def welcome_email(user)
    @user = user
    @url  = 'http://deltakids.ca/dashboard'
    mail(to: @user.email, subject: 'Welcome to Delta Kids')
  end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end

end
