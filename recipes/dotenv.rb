REPO = "https://raw.githubusercontent.com/spartansystems/spartan-composer-recipes/master/files/".freeze
gem "dotenv-rails", group: [:development, :test]

after_bundle do
  copy_from_repo ".env.example", repo: REPO
end

__END__
name: dotenv
description: "Add rollbar to your application"

category: configuration
