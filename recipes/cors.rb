REPO = "https://raw.githubusercontent.com/spartansystems/spartan-composer-recipes/master/files/".freeze
gem 'rack-cors'

stage_two do
  copy_from_repo "config/initializers/cors.rb", repo: REPO

  append_to_file ".env.example" do
    "CORS_ORIGINS=localhost\n"
  end

  append_to_file ".env" do
    "CORS_ORIGINS=localhost\n"
  end
end

__END__

name: 'cors'
description: 'Configure Rack CORS gem so Devise Auth Token works'

category: api
requires: [dotenv]
run_after: [dotenv]
