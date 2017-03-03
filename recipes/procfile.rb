REPO = "https://raw.githubusercontent.com/spartansystems/spartan-composer-recipes/master/files/".freeze

stage_one do
  copy_from_repo "Procfile", repo: REPO
end
__END__

name: procfile
description: "Add the default Foreman Procfile for Heroku"

category: initialize
