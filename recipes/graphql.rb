REPO = "https://raw.githubusercontent.com/verypossible/very-composer-recipes/master/files/".freeze

gem "graphql"
gem "graphiql-rails", group: %i(development test)

stage_three do
  inject_into_file(
    "config/routes.rb",
    "\n  post 'graphql' => 'graphql#execute'",
    after: "Rails.application.routes.draw do"
  )

  graphiql_route = <<-TEXT

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end
  TEXT

  inject_into_file(
    "config/routes.rb",
    graphiql_route,
    after: "Rails.application.routes.draw do"
  )

  run "bin/rails g controller Graphql"

  query_action = <<-TEXT

  def execute
    query_string = params[:query]
    query_variables = params[:variables]
    result = Schema.execute(query_string, variables: query_variables, context: {})
    render json: result
  end
  TEXT

  inject_into_file(
    "app/controllers/graphql_controller.rb",
    query_action,
    after: "class GraphqlController < ApplicationController"
  )

  graphql_files = %w(
    app/graphql/schema.rb
    app/graphql/types/mutation_type.rb
    app/graphql/types/query_type.rb
    app/graphql/types/user_type.rb
    app/graphql/mutations/create_user.rb
    app/graphql/interfaces/active_record_object_interface.rb
  )

  graphql_files.each do |graphql_schema_file|
    copy_from_repo graphql_schema_file, repo: REPO
  end
end

__END__

name: 'GraphQL'
description: 'For adding a graphQL interface for APIs'

category: api
