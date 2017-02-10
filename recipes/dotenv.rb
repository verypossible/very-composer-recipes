REPO = "https://raw.githubusercontent.com/spartansystems/spartan-composer-recipes/master/files/".freeze
gem "dotenv-rails", group: [:development, :test]

stage_two do
  copy_from_repo ".env.example", repo: REPO
  get "#{REPO}/.env.example", ".env"
end

__END__
name: dotenv
description: "Add dotenv to your application"

category: configuration
