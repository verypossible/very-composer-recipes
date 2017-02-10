Rails.application.configure do
  config.middleware.use Rack::Cors do
    allow do
      origins ENV.fetch('CORS_ORIGINS', 'localhost').split(',').map(&:strip)
      resource '*',
               headers: :any,
               expose: %w(access-token expiry token-type uid client),
               methods: %i(get post options delete put)
    end
  end
end
