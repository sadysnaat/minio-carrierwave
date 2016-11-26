require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MinioCarrierwave
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true


    CarrierWave.configure do |config|
      config.fog_provider = 'fog/aws'                        # Mention Fog provider
      config.fog_credentials = {
        provider:              'AWS',                        # required
        aws_access_key_id:     'Q3AM3UQ867SPQQA43P2F',                        
        aws_secret_access_key: 'zuf+tfteSlswRu7BJ86wekitnifILbZam1KYY3TG',        
        region:                'us-east-1',                  # optional, defaults to 'us-east-1',
                                                             # Please mention other regions if you have changed 
                                                             # minio configuration
        host:                  'play.minio.io',              # Provide your host name here, otherwise fog-aws defaults to
                                                             # s3.amazonaws.com
        endpoint:              'https://play.minio.io:9000', # Required, otherwise defauls to nil
        path_style:         true                             # Required 
      }
      config.fog_directory  = 'carrierwave'
    end
  end
end
