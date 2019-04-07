class PendingResourceMailer < ApplicationMailer
  default from: 'coordinator@deltakids.ca'
  default to: 'denises@reachchild.org'

  def approved_resource_email(resource)
    @resource = resource
    @url  = "http://deltakids.ca/resources/#{@resource.id}"
    mail(to: @resource.user.email, subject: 'Your request for a new Resource has been approved')
  end

  def decline_email(resource,resource_email,message)
    @resource = resource
    @email = resource_email
    @message = message
    mail(to: resource_email, subject: 'Your request for a new Resource has been declined')
  end

  def pending_resource_notice_email(resource)
    @resource = resource
    @url  = 'http://deltakids.ca/dashboard'
    mail(from: @resource.user.email, subject: 'Pending Resource')
  end

end
