require File.expand_path('../boot', __FILE__)

require 'rails/all'
I18n.available_locales = [:en, :ru]
Bundler.require(*Rails.groups)

module PaymentEvents
  class Application < Rails::Application
    config.paperclip_defaults = { storage: :fog, fog_credentials: { provider: "Local", local_root: "#{Rails.root}/public"}, fog_directory: "", fog_host: "localhost"}
  end
end
