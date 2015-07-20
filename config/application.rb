require File.expand_path('../boot', __FILE__)

require 'rails/all'
I18n.available_locales = [:en, :ru]
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PaymentEvents
  class Application < Rails::Application
    # I18n.available_locales = [:en, :ru]
    # config.i18n.default_locale = :ru
  end
end
