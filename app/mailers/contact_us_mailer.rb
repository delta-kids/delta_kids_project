class ContactUsMailer < ApplicationMailer
  default to: 'chrispbehcon@gmail.com'

  def contact_email(name, email, message)
    @name = name
    @email = email
    @message = message

     mail(from: email, subject: 'Contact Request')
  end

end
