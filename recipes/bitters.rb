gem "bitters"

stage_two do
  run "cd app/assets/stylesheets/ && bundle exec bitters install"
  insert_into_file "app/assets/stylesheets/application.scss",
                   "@import \"base/base\";\n",
                   after: "@import \"bourbon\";\n"
end

__END__

name: bitters
description: "Add bitters to your application"

category: frontend
requires: [bourbon]
run_after: [bourbon]
