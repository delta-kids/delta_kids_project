class ApplicationMailer < ActionMailer::Base
  default from: ENV['EmailDefaultFrom']
  layout 'mailer'
end
