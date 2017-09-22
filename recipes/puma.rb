REPO = "https://raw.githubusercontent.com/verypossible/very-composer-recipes/master/files/".freeze

stage_two do
  copy_from_repo "config/puma.rb", repo: REPO
end
__END__

name: puma
description: "Add the custom Very Puma Configuration"

category: configuration
