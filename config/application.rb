require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Todo
  class Application < Rails::Application
    config.time_zone = 'Asia/Kuala_Lumpur'
    config.active_record.default_timezone = :local

    config.autoload_paths += %W(#{config.root}/app)
    config.i18n.default_locale = :en
    config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
ActionMailer::Base.smtp_settings = {
  :address              => 'smtp.gmail.com',
  :domain               => 'gmail.com',
  :port                 =>  587,
  :user_name            => "bydlovasya1488@gmail.com",
  :password             => "allahuakbar1998",
  :authentication       => 'plain',
  :enable_starttls_auto => true
}

  end
end
