if %w(development staging).include?(ENV["APPLICATION_ENVIRONMENT"])
  Rails.application.configure do
    config.after_initialize do
      Bullet.enable = true
      Bullet.console = true
      Bullet.rails_logger = true
      Bullet.rollbar = true
      Bullet.alert = !ENV["BULLET_SHOW_ALERT"].nil?
      Bullet.add_footer = !ENV["BULLET_SHOW_FOOTER"].nil?
    end
  end
end
