gem 'aws-sdk', '< 2.0'
gem 'paperclip', '~> 5.0.0'

paperclip_defaults = <<-TEXT
    # Paperclip Config
    config.paperclip_defaults = {
        storage: :s3,
        s3_protocol: "",
        s3_region: ENV.fetch("AWS_S3_REGION", ""),
        s3_credentials: {
          bucket: ENV.fetch("AWS_S3_BUCKET", ""),
          access_key_id: ENV.fetch("AWS_ACCESS_KEY", ""),
          secret_access_key: ENV.fetch("AWS_SECRET", "")
        }
      }
TEXT

inject_into_file(
  'config/application.rb',
  paperclip_defaults,
  after: 'config.active_record.raise_in_transactional_callbacks = true'
)

__END__

name: paperclip
description: "Add paperclip to your application"

category: other
requires: [setup]
run_after: [setup]
