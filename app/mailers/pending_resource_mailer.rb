class PendingResourceMailer < ApplicationMailer
  default from: 'coordinator@deltakids.ca'

  def decline_email(resource,resource_email,message)
    @resource = resource
    @email = resource_email
    @message = message
    mail(to: resource_email, subject: 'Your request for a new Resource has been declined')
  end
end
