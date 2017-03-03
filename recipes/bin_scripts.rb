REPO = "https://raw.githubusercontent.com/spartansystems/spartan-composer-recipes/master/files/".freeze

stage_two do
  %w(bin/init bin/up bin/down).each do |script|
    copy_from_repo script, repo: REPO
    chmod script, 0755
  end
end
__END__

name: bin_scripts
description: "Add custom Spartan bin scripts for initializing and running the app"

category: initialize
