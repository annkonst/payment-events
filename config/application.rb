require File.expand_path('../boot', __FILE__)

require 'rails/all'
I18n.available_locales = [:en, :ru]
Bundler.require(*Rails.groups)

module PaymentEvents
  class Application < Rails::Application
  end
end
