# very-composer-recipes

## Dependecies

* ruby 2.4+
* rails_apps_composer `gem install rails_apps_composer`

## To build an app from scratch

1. Go to your developement directory.
2. Run the following: `rails_apps_composer new myAppName -l very-composer-recipes/recipes`.
3. This will allow you to build an app with all recipe choices available. You can make whichever selections you see fit.

## To build an API app from a template
1. Go to your development directory.
2. Be sure you have the very composer repo cloned: `git clone git@github.com:verypossible/very-composer-recipes.git`.
3. Run the following: `rails new myAppName -m very-composer-recipes/templates/very-api.rb --api`.
4. You should have a new app to begin development on.
5. Note: (The default DB is currently sqlite3. But the db config has defaults for postgres if you want to switch.)

## To build the API template
1. Run this command to generate your template file `rails_apps_composer template templates/very-api.rb -l recipes/ --defaults=./defaults/very-api-defaults.yml`

## Available templates
* very-api
* very-graphql-api

## To deploy demo API to Heroku (Currently must be done manually)
1. If you already have a demo app linked to heroku then skip to step 8.
2. Create a new app following the `To build an API app from a template` instructions
3. Enter the new app directory
4. Run `git init`
5. Run `git add .`
6. Run `git commit -a -m 'Initial Commit'
7. Run `heroku git:remote -a very-rails-booster-kit-demo
8. Run `git push -f heroku master`
9. Note: (For now deploys are destructive to the DB)
