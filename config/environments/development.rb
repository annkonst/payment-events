Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true
  # Raises error for missing translations
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.consider_all_requests_local = false
  # Exception Notification
  config.middleware.use ExceptionNotification::Rack,
                        :email => {
                            :email_prefix => "[PREFIX] ",
                            :sender_address => %{"Error" <notifications@kodep.ru>},
                            :exception_recipients => %w{notifications@kodep.ru},
                            :delivery_method => :smtp,
                            :smtp_settings => {
                                :address              => "smtp.yandex.ru",
                                :port                 => 587,
                                :user_name            => "notifications@kodep.ru",
                                :password             => "Phiosi9i",
                                :authentication       => "plain",
                            }
                        }
  config.after_initialize do
    Bullet.enable = true
    Bullet.alert = true
    Bullet.bullet_logger = true
    Bullet.rollbar = true
    Bullet.rails_logger = true
    Bullet.console = true
    Bullet.add_footer = true
    Bullet.stacktrace_includes = [ 'your_gem', 'your_middleware' ]
  end
end