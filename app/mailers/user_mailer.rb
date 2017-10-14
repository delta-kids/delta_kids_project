class UserMailer < ApplicationMailer
  default from: 'chrispbehcon@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/events'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
