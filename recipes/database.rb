REPO = "https://raw.githubusercontent.com/spartansystems/spartan-composer-recipes/master/files/".freeze
gem "pg"

stage_one do
  copy_from_repo "config/database.yml", repo: REPO
end
__END__

name: database
description: "Add custom Spartan Database configuration"

category: configuration
