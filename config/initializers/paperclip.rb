Rails.application.configure do
  config.paperclip_defaults = {
    storage: :s3,
    s3_credentials: {
      bucket: ENV.fetch('S3_BUCKET_NAME'),
      access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
      secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
      s3_region: ENV.fetch('AWS_REGION'),
    }
  }
end

# Paperclip::Attachment.default_options.tap do |o|
#   o[:url] = ':s3_domain_url'
#   o[:path] = '/:class/:attachment/:id_partition/:style/:filename'
# end
