require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsBootcamp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # custom config settings - added by adrian
    
    # set the store url to login to with multipass
    config.shop_domain = "test-store-adrian-corcoran-01.myshopify.com"
    config.shop_url = "https://test-store-adrian-corcoran-01.myshopify.com"
    
    # set the store api creds
    config.shop_api_url = "https://#{Rails.application.credentials.shop_api_key}:#{Rails.application.credentials.shop_api_password}@test-store-adrian-corcoran-01.myshopify.com"
    config.shop_api_version = "2019-07"
  end
end
