gem 'aws-sdk', '< 2.0'
gem 'paperclip', '~> 5.0.0'

paperclip_config_start = <<-TEXT

    # Paperclip Config
    config.paperclip_defaults = {
TEXT

paperclip_config_defaults = <<-TEXT
      storage: :s3,
      s3_protocol: '',
      s3_region: ENV.fetch('AWS_S3_REGION', ''),
      s3_credentials: {
        bucket: ENV.fetch('AWS_S3_BUCKET', ''),
        access_key_id: ENV.fetch('AWS_ACCESS_KEY', ''),
        secret_access_key: ENV.fetch('AWS_SECRET', '')
      }
TEXT

paperclip_config_cloudfront = <<-TEXT
      url: ':s3_alias_url',
      s3_host_alias: ENV.fetch('AWS_CLOUDFRONT_DOMAIN', ''),
      path: '/:class/:attachment/:id_partition/:style/:filename',
TEXT

paperclip_config_end = '    }'

paperclip_config = paperclip_config_start
paperclip_config += paperclip_config_cloudfront if config['cloudfront']
paperclip_config += paperclip_config_defaults
paperclip_config += paperclip_config_end

inject_into_file(
  'config/application.rb',
  paperclip_config,
  after: 'class Application < Rails::Application'
)

__END__

name: paperclip
description: "Add paperclip to your application"

category: other
requires: [setup]
run_after: [setup]

config:
  - cloudfront:
      type: boolean
      prompt: Do you want to distribute your paperclips attachments with Cloudfront?
