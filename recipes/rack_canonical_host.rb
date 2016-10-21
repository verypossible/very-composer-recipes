gem "rack-canonical-host"

middleware_setup = <<-TEXT

  config.middleware.insert_after 0, Rack::CanonicalHost, ENV['APPLICATION_HOST'] if ENV.key?('APPLICATION_HOST')
TEXT

inject_into_file(
  "config/application.rb",
  middleware_setup,
  after: "class Application < Rails::Application"
)

__END__

name: rack-canonical-host
description: "Add rack-canonical-host to your application"

category: other
