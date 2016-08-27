REPO = 'https://raw.githubusercontent.com/spartansystems/spartan-composer-recipes/master/configs/'.freeze
gem 'slim_lint'

after_bundle do
  copy_from_repo '.slim-lint.yml', repo: REPO
end

__END__

name: slim-lint
description: "Adding slim linter to your application"

category: other
requires: [spartan_setup]
run_after: [spartan_setup, extras]
args: -T
