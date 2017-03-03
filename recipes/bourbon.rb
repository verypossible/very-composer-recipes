gem "bourbon"

stage_two do
  prepend_to_file "app/assets/stylesheets/application.scss",
                  "@import \"bourbon\";\n"
end
__END__

name: bourbon
description: "Add bourbon to your application"

category: frontend
requires: [sass_setup]
run_after: [sass_setup]
