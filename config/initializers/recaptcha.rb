Recaptcha.configure do |config|
  config.site_key  = Rails.application.credentials[:site_key_recaptcha]
  config.secret_key = Rails.application.credentials[:secret_key_recaptcha]
end
