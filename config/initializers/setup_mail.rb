ActionMailer::Base.smtp_settings = {
  address:              "smtp.deltakids.ca",
  port:                 "587",
  domain:               "deltakids.ca",
  authentication:       :plain,
  enable_starttls_auto: true,
  openssl_verify_mode:  "none",
  user_name:            ENV["email_user_name"],
  password:             ENV["email_password"]
}
