REPO = "https://raw.githubusercontent.com/verypossible/very-composer-recipes/master/files/".freeze

stage_two do
  copy_from_repo "Procfile", repo: REPO
end
__END__

name: procfile
description: "Add the default Foreman Procfile for Heroku"

category: initialize
