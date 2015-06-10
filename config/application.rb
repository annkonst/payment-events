require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PaymentEvents
  class Application < Rails::Application
     i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
     i18n.default_locale = :ru
  end
end
