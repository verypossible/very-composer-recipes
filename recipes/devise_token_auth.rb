gem 'devise_token_auth'

stage_three do
  run 'bin/rails g devise_token_auth:install User api/auth'
  inject_into_file(
    "config/routes.rb",
    ", skip: [:omniauth_callbacks]",
    after: "at: 'api/auth'"
  )
  gsub_file(
    "app/models/user.rb",
    ', :omniauthable',
    '')
  run 'bin/rails db:migrate'
end

__END__

name: 'Devise Token Auth'
description: 'For API authentication backed by Devise'

category: api
