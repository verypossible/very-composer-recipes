Schema = GraphQL::Schema.define do
  query Types::QueryType
  mutation Types::MutationType
  resolve_type ->(type, obj, ctx) {}
end
