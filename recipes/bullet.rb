REPO = "https://raw.githubusercontent.com/spartansystems/spartan-composer-recipes/master/files/".freeze
gem "bullet"

stage_two do
  copy_from_repo "config/initializers/bullet.rb", repo: REPO

  append_to_file ".env.example" do
    "BULLET_SHOW_ALERT=true\nBULLET_SHOW_FOOTER=true\n"
  end
end
__END__

name: bullet
description: "Add bullet to your application"

category: other
requires: [dotenv]
run_after: [dotenv]
