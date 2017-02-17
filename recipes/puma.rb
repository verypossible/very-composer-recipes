REPO = "https://raw.githubusercontent.com/spartansystems/spartan-composer-recipes/master/files/".freeze

stage_two do
  copy_from_repo "config/puma.rb", repo: REPO
end
__END__

name: puma
description: "Add the custom Spartan Puma Configuration"

category: configuration
