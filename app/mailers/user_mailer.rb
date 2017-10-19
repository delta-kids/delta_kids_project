class UserMailer < ApplicationMailer
  default from: 'chrispbehcon@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://deltakids.ca/dashboard'
    mail(to: @user.email, subject: 'Welcome to Delta Kids')
  end
end
