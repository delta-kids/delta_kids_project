ActionMailer::Base.smtp_settings = {
  address:              "smtp.gmail.com",
  port:                 "587",
  authentication:       :plain,
  user_name:            ENV["email_user_name"],
  password:             ENV["email_password"],
  domain:               'mail.google.com',
  enable_starttls_auto: true
}
