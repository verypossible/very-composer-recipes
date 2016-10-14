gem "shoulda-matchers", "~> 3.1", group: :test

stage_two do
  insert_into_file "spec/rails_helper.rb",
                   "require \"shoulda/matchers\"\n",
                   after: "require 'rspec/rails'\n"

  append_to_file "spec/rails_helper.rb" do
    <<-eos

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
    eos
  end
end
__END__

name: shoulda-matchers
description: "Add shoulda-matchers to your application"

category: testing
requires: [tests]
run_after: [tests]
