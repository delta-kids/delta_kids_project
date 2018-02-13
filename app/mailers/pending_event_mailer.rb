class PendingEventMailer < ApplicationMailer
  default from: 'coordinator@deltakids.ca'
  default to: 'coordinator@deltakids.ca'

  def approved_event_email(event)
    @event = event
    @url  = "http://deltakids.ca/events/#{@event.id}"
    mail(to: @event.user.email, subject: 'Your request for a new Event has been approved')
  end


  def decline_email(event,event_email,message)
    @event = event
    @email = event_email
    @message = message
    mail(to: event_email, subject: 'Your request for a new Event has been declined')
  end

  def pending_event_notice_email(event)
    @event = event
    @url  = 'http://deltakids.ca/dashboard'
    mail(from: @event.user.email, subject: 'Pending Event')
  end

end
