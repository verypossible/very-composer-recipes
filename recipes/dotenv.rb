REPO = "https://raw.githubusercontent.com/verypossible/very-composer-recipes/master/files/".freeze
gem "dotenv-rails", group: %i(development test)

stage_two do
  copy_from_repo ".env.example", repo: REPO
  get "#{REPO}/.env.example", ".env"
end

__END__
name: dotenv
description: "Add dotenv to your application"

category: configuration
