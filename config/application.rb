require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Otoshimono
  class Application < Rails::Application
    config.autoload_paths += Dir["#{config.root}/app/services", "#{config.root}/app/validators", "#{config.root}/lib"]
    config.i18n.default_locale = :ja
    config.active_record.raise_in_transactional_callbacks = true
    config.time_zone = 'Asia/Tokyo'
  end
end
