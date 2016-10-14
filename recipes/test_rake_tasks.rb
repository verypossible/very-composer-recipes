REPO = "https://raw.githubusercontent.com/spartansystems/spartan-composer-recipes/master/files/".freeze

after_bundle do
  copy_from_repo "lib/tasks/factory_girl.rake", repo: REPO

  append_to_file "Rakefile" do
    <<-eos

require "slim_lint/rake_task"
require "rubocop/rake_task"
RuboCop::RakeTask.new
SlimLint::RakeTask.new

task(:default).clear
task default: ["factory_girl:lint", :spec, :rubocop, :slim_lint]

if defined? RSpec
  task(:spec).clear
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.verbose = false
  end
end
    eos
  end
end

__END__

name: factory_girl_rails
description: "Add factory_girl_rails to your application"

category: testing
requires: [tests, factory_girl_rails, database_cleaner, rubocop, slim_lint]
run_after: [tests]
