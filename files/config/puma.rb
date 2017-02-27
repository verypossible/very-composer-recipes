# frozen_string_literal: true

lowlevel_error_handler do |e|
  Rollbar.critical(e)

  msg = "An error has occurred, and engineers have been informed. Please " \
          "reload the page. If you continue to have problems, contact us.\n"

  [500, {}, [msg]]
end

threads Integer(ENV["MIN_THREADS"] || 1), Integer(ENV["MAX_THREADS"] || 16)
workers Integer(ENV["PUMA_WORKERS"] || 2)

preload_app!

port ENV["PORT"] || 3000
environment ENV["RAILS_ENV"] || "production"

plugin :tmp_restart
