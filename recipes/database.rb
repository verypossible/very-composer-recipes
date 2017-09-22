REPO = "https://raw.githubusercontent.com/verypossible/very-composer-recipes/master/files/".freeze
gem "pg"

inject_into_file(
  "Gemfile",
  ", group: [:development, :test]",
  after: "gem 'sqlite3'"
)

stage_two do
  copy_from_repo "config/database.yml", repo: REPO
end
__END__

name: database
description: "Add custom Very Database configuration"

category: configuration
