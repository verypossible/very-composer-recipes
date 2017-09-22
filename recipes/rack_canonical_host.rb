gem "rack-canonical-host"

middleware_setup = <<-TEXT

    config.application_host = ENV.fetch('APPLICATION_HOST')
    config.middleware.insert_after 0, Rack::CanonicalHost, config.application_host if Rails.env.production?
TEXT

inject_into_file(
  "config/application.rb",
  middleware_setup,
  after: "class Application < Rails::Application"
)

uncomment_lines(
  "config/environments/production.rb",
  "config.force_ssl = true"
)

inject_into_file(
  "config/environments/production.rb",
  "\n  config.ssl_options = { redirect: { host: config.application_host } }",
  after: "config.force_ssl = true"
)

mailer_host = <<-TEXT

  config.action_mailer.default_url_options = { host: config.application_host }
TEXT

%w(production development).each do |env|
  inject_into_file(
    "config/environments/#{env}.rb",
    mailer_host,
    after: "config.action_mailer.raise_delivery_errors = false"
  )
end

__END__

name: rack-canonical-host
description: "Add rack-canonical-host to your application"

category: other
requires: [dotenv]
run_after: [dotenv]
