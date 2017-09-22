REPO = "https://raw.githubusercontent.com/verypossible/very-composer-recipes/master/files/".freeze
gem "slim_lint"

stage_two do
  copy_from_repo ".slim-lint.yml", repo: REPO
end

__END__

name: slim-lint
description: "Adding slim linter to your application"

category: other
requires: [setup]
run_after: [setup, extras]
args: -T
