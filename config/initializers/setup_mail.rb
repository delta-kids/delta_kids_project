ActionMailer::Base.smtp_settings = {
  address:              "smtp.gmail.com",
  port:                 "587",
  authentication:       :plain,
  user_name:            ENV["EmailDefaultFrom"],
  password:             ENV["EmailDefaultPassword"],
  domain:               'mail.google.com',
  enable_starttls_auto: true
}
