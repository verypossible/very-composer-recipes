Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The query root of this schema'

  field :users, types[Types::UserType] do
    description 'All Users'
    resolve ->(_obj, _args, _ctx) { User.find_each }
  end

  field :user do
    type Types::UserType
    description 'User By ID'
    argument :id, types.Int
    resolve ->(_obj, args, _ctx) { User.find(args[:id]) }
  end
end
