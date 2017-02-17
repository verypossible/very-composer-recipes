REPO = "https://raw.githubusercontent.com/spartansystems/spartan-composer-recipes/master/files/".freeze

stage_one do
  copy_from_repo "bin/init", repo: REPO
  copy_from_repo "bin/up", repo: REPO
  copy_from_repo "bin/down", repo: REPO
end
__END__

name: bin_scripts
description: "Add custom Spartan bin scripts for initializing and running the app"

category: initialize
