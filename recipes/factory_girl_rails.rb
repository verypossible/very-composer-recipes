gem "factory_girl_rails", group: [:development, :test]

stage_two do
  insert_into_file "spec/rails_helper.rb",
                   "config.include FactoryGirl::Syntax::Methods\n",
                   after: "RSpec.configure do |config|\n"
end
__END__

name: factory_girl_rails
description: "Add factory_girl_rails to your application"

category: testing
requires: [tests]
run_after: [tests]
