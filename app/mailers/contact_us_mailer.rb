class ContactUsMailer < ApplicationMailer
  default to: ENV['EmailDefaultTo']

  def contact_email(name, email, message)
    @name = name
    @email = email
    @message = message

     mail(from: email, subject: 'Contact Request')
  end

end
