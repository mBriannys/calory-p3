# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
      :address => 'smtp.sendgrid.net',
      :port => '587',
      :authentication => :plain,
      :user_name => Rails.application.credentials.dig(:user_name),
      :password => Rails.application.credentials.dig(:password),
      :domain => 'heroku.com',
      :enable_starttls_auto => true
    }

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.default_url_options ={:host => 'http://localhost:3000'}
