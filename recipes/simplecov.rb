gem "simplecov", require: false, group: :test

stage_two do
  prepend_to_file "spec/spec_helper.rb" do
    <<-eos
if ENV.fetch("COVERAGE", false)
  require "simplecov"
  SimpleCov.start "rails" do
    add_filter "/app/admin/"
  end
end
    eos
  end

  append_to_file ".gitignore" do
    "# Ignore test coverage\ncoverage/\n"
  end
end

after_bundle do
  append_to_file ".env.example" do
    "COVERAGE=true\n"
  end
end

__END__

name: simplecov
description: "Add simplecov to your application"

category: testing
requires: [dotenv, tests]
run_after: [dotenv, tests]
