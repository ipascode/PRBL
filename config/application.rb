require_relative 'boot'

require 'rails/all'

ActiveSupport::Deprecation.silenced = true


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Maintainapp
  class Application < Rails::Application
  	config.time_zone = 'Asia/Manila'
  	 config.active_record.time_zone_aware_types = [:datetime, :time]
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
