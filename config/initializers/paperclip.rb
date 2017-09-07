Rails.application.configure do
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
end
