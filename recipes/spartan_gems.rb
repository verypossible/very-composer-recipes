### GEMFILE ###

## Ruby on Rails
insert_into_file('Gemfile', "ruby '#{RUBY_VERSION}'\n", before: /^ *gem 'rails'/, force: false)

## Cleanup
# remove the 'sdoc' gem
if Rails::VERSION::MAJOR == 4 && Rails::VERSION::MINOR >= 2
  gsub_file 'Gemfile', /gem 'sdoc',\s+'~> 0.4.0',\s+group: :doc/, ''
else
  gsub_file 'Gemfile', /group :doc do/, ''
  gsub_file 'Gemfile', /\s*gem 'sdoc', require: false\nend/, ''
end

add_gem 'puma'

gsub_file 'Gemfile', /gem 'sqlite3'\n/, ''
add_gem 'pg'
copy_from_repo 'config/database-postgresql.yml', prefs: 'postgresql'

add_gem 'slim-rails'
add_gem 'haml2slim', group: :development
add_gem 'html2haml', group: :development

add_gem 'rails_apps_testing', group: :development
add_gem 'rspec-rails', group: [:development, :test]
add_gem 'spring-commands-rspec', group: :development
add_gem 'factory_girl_rails', group: [:development, :test]
add_gem 'faker', group: [:development, :test]
add_gem 'capybara', group: :test
add_gem 'database_cleaner', group: :test
add_gem 'launchy', group: :test
add_gem 'selenium-webdriver', group: :test

add_gem 'devise'

__END__

name: spartan_gems
description: "Add the gems your application needs."

requires: [spartan_setup]
run_after: [spartan_setup]
category: configuration
