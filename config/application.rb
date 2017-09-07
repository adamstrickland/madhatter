require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

HOSTNAME = ENV['HOSTNAME']

module Madhatter
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.paperclip_defaults = {
      storage: :s3,
      s3_credentials: {
        access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
        secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
        bucket: ENV.fetch('S3_BUCKET_NAME'),
        s3_region: ENV.fetch('AWS_REGION'),
      },
      url: ":s3_domain_url",
      path: "/:class/:attachment/:id_partition/:style/:filename",
    }

    config.action_controller.asset_host = "d2d1a1efa424rj.cloudfront.net"
  end
end
