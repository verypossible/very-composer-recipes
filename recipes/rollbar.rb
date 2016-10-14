REPO = "https://raw.githubusercontent.com/spartansystems/spartan-composer-recipes/master/files/".freeze
gem "rollbar"

after_bundle do
  copy_from_repo "config/initializers/rollbar.rb", repo: REPO
  copy_from_repo "vendor/assets/javascripts/rollbar.js.erb", repo: REPO

  append_to_file ".env.example" do
    "ROLLBAR_CLIENT_ACCESS_TOKEN=''\nROLLBAR_SERVER_ACCESS_TOKEN=''\n"
  end
end
__END__

name: rollbar
description: "Add rollbar to your application"

category: other
requires: [dotenv]
run_after: [dotenv]
