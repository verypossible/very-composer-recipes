require "rollbar/rails"
require "rack/timeout/rollbar"
Rollbar.configure do |config|
  if ENV["ROLLBAR_SERVER_ACCESS_TOKEN"]
    config.js_enabled = false
    config.access_token = ENV["ROLLBAR_SERVER_ACCESS_TOKEN"]
  else
    config.enabled = false
  end

  config.environment = ENV.fetch("APPLICATION_ENVIRONMENT")
  config.js_options = {
    accessToken: ENV["ROLLBAR_CLIENT_ACCESS_TOKEN"],
    captureUncaught: true,
    payload: {
      environment: ENV.fetch("APPLICATION_ENVIRONMENT")
    }
  }
end
