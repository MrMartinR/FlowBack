require_relative 'boot'

# unninstalling sprockets @link https://stackoverflow.com/questions/59515219/remove-sprockets-from-rails
# require 'rails/all'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Flow
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    #//Add this to config/application.rb
    #
    # config.middleware.use Rack::Cors do
    #   allow do
    #     origins '*'
    #     resource '*',
    #              headers: :any,
    #              expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'],
    #              methods: [:get, :post, :options, :delete, :put, :patch]
    #   end
    # end
    config.api_only = true
    config.middleware.use ActionDispatch::Flash

    config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'
      resource '*', :headers => :any,
               :methods => [:get, :post, :options, :put, :delete],
                    expose: ['access-token', 'expiry', 'token-type', 'uid', 'client']
    end
  end
  end
end
