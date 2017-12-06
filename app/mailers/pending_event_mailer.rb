class PendingEventMailer < ApplicationMailer
  default from: 'coordinator@deltakids.ca'

  def decline_email(event,event_email,message)
    @event = event
    @email = event_email
    @message = message
    mail(to: event_email, subject: 'Your request for a new Event has been declined')
  end

end
